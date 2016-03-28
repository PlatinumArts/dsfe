local block_sounds = {}
local player_name = {}

minetest.register_node("mysoundblocks:block", {
	description = "Sound Block",
	drawtype = "normal",
	tiles = {"mysoundblocks_block.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = 0},
	
	on_dig = function(pos, node, player)

		if minetest.get_player_privs(player:get_player_name()).mysoundblocks ~= true then

			minetest.chat_send_player(player:get_player_name(),
				"You need the mysoundblocks priv")
			return
		end

		if minetest.get_player_privs(player:get_player_name()).mysoundblocks == true then

			minetest.remove_node(pos)
		end

	end,

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

		local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)

		minetest.show_formspec(player:get_player_name(),"fs",
				"size[6,6;]"..
				"field[1,1;4.5,1;snd;Enter Sound Name;]"..
				"field[1,2.5;2,1;sndl;Length;]"..
				"field[3.5,2.5;2,1;sndhd;Sound distance;]"..
				"button_exit[1,5;4,1;ent;Set Block]")

		minetest.register_on_player_receive_fields(function(player, formname, fields)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local thing1 = fields["snd"]
		local thing2 = fields["sndl"]
		local thing3 = fields["sndhd"]

			if fields["ent"] and
				fields["snd"] and
				fields["sndl"] and
				fields["sndhd"] then
				if fields["ent"] then
					meta:set_string("a",thing1)
					meta:set_string("b",thing2)
					meta:set_string("c",thing3)
					minetest.swap_node(pos,{name = "mysoundblocks:block_hidden"})

				end
			else
				return
			end
			
		end)


end

})

minetest.register_node("mysoundblocks:block_hidden", {
	tiles = {
		"mysoundblocks_hidden.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	walkable = false,
	pointable = false,
	group = {not_in_creative_inventory = 1},
})

minetest.register_privilege("mysoundblocks", "Lets you place and dig soundblocks")

minetest.register_chatcommand("showsb", {
	params = "",
	description = "Show the sound block",
	privs={mysoundblocks = true},

	func = function(name, param)

		local player = minetest.get_player_by_name(name)

		if not player then
			return false, "Player not found"
		end

		local pos = player:getpos()
			pos.y = pos.y + 1
		local npos = minetest.find_node_near(pos, 5, "mysoundblocks:block_hidden")
		local node = minetest.get_node(npos).name
		local n = minetest.get_node(pos).name

			if pos and npos and node then
				minetest.swap_node(npos,{name = "mysoundblocks:block"})
			end

	end
})

minetest.register_chatcommand("hidesb", {
	params = "",
	description = "Hide the sound block",
	privs = {mysoundblocks = true},

	func = function(name, param)

		local player = minetest.get_player_by_name(name)

		if not player then
			return false, "Player not found"
		end

		local pos = player:getpos()
			pos.y = pos.y + 1
		local npos = minetest.find_node_near(pos, 5,"mysoundblocks:block")
		local node = minetest.get_node(npos).name

		if pos and npos and node then
			minetest.swap_node(npos,{name = "mysoundblocks:block_hidden"})
		end
	end
})

minetest.register_abm({
	nodenames = {"mysoundblocks:block_hidden"},
	interval = 1, -- abm's start from 1 second and above
	chance = 1,
	catch_up = false,

	action = function(pos, node, active_object_count, active_object_count_wider)

		local meta = minetest.get_meta(pos)
		local block_sound = meta:get_string("a")

			if block_sound == nil or
				block_sound == "" then
				minetest.swap_node(pos,{name = "mysoundblocks:block"})
				return
			end

		local block_time = tonumber(meta:get_string("b"))

			if block_time == nil then
				block_time = 5
			end

		local rad_dist = tonumber(meta:get_string("c"))

			if rad_dist == nil then
				rad_dist = 3
			end

		local all_objects = minetest.get_objects_inside_radius(pos, rad_dist)
		local p

		for _,obj in ipairs(all_objects) do

			if obj:is_player() then

				p = obj:get_player_name()

				if not player_name[p] then

					player_name[p] = true

						minetest.sound_play(block_sound, {
							max_hear_distance = 10,
							to_player = player,
							gain = 1.0,
						})

					minetest.after(block_time, function(p) -- time before player can hear the sound again
						player_name[p] = nil -- reset player
					end, p)

				end
			end
		end
	end
})

