--To add or delete items modify the lines below.
--Add or delete local item#
--For each local item# add or delete the minetest.spawn_item in the next section.

local item1 = "default:diamond 3"
local item2 = "default:steel_ingot 10"
local item3 = "default:sand 5"
local item4 = "default:pick_steel"
local item5 = "default:mese_crystal 3"

local item_spawn = function(pos, node)
	pos.y = pos.y-0.3
	local objs = {
		minetest.spawn_item(pos, item1),
		minetest.spawn_item(pos, item2),
		minetest.spawn_item(pos, item3),
		minetest.spawn_item(pos, item4),
		minetest.spawn_item(pos, item5)
	}
	pos.y = pos.y+0.3
	minetest.set_node(pos, {name="myitemchest:chest_open_storage", param2=node.param2})
	minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name="myitemchest:chest_formspec", param2=node.param2})
	--pos.y = pos.y-0.5
	for _,object in pairs(objs) do
		object:setvelocity({x=0, y=4.5, z=0})
	end
end

local check_air = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			local nodea = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
				if nodea.name ~= "air" then
				minetest.chat_send_player( placer:get_player_name(), "Need room above chest" )
				return
				end
			return minetest.item_place(itemstack, placer, pointed_thing)
			end

local dig_it = function(pos, node, digger)
		local meta = minetest.get_meta({x=pos.x,y=pos.y+1,z=pos.z});
		local inv = meta:get_inventory()
		local nodeu = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
		if nodeu.name == "myitemchest:chest_formspec" and
			inv:is_empty("main") then
			minetest.remove_node({x=pos.x,y=pos.y+1,z=pos.z})
			minetest.remove_node(pos)
			minetest.spawn_item(pos,"myitemchest:chest_storage")
		else
			minetest.chat_send_player( digger:get_player_name(), "Chest is not empty" )
		end
	end

local closed_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.3125, 0.375},
		}
	}

local open_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.3125, 0.5, -0.4375, 0.375},
			{-0.5, -0.5, 0.3125, 0.5, 0.1875, 0.375},
			{-0.5, -0.5, -0.3125, -0.4375, 0.1875, 0.375},
			{0.4375, -0.5, -0.3125, 0.5, 0.1875, 0.375},
			{-0.5, -0.5, -0.3125, 0.5, 0.1875, -0.25},
			{-0.5, 0.1875, 0.4375, 0.5, 0.875, 0.5},
			{-0.5, 0.1875, 0.375, 0.5, 0.25, 0.5},
			{-0.5, 0.8125, 0.375, 0.5, 0.875, 0.5},
			{-0.5, 0.1875, 0.375, -0.4375, 0.875, 0.5},
			{0.4375, 0.1875, 0.375, 0.5, 0.875, 0.5},
		}
	}

local chest_formspec =
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;main;0,0.3;8,4;]" ..
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,4.85)

minetest.register_node("myitemchest:chest", {
	description = "Item Chest",
	tiles = {
		"myitemchest_chest_top.png",
		"myitemchest_chest_top.png",
		"myitemchest_chest_side.png^[transformFX",
		"myitemchest_chest_side.png",
		"myitemchest_chest_back.png",
		"myitemchest_chest_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2},
	sounds = default.node_sound_wood_defaults(),
	node_box = closed_box,
	selection_box = closed_box,
	on_place = check_air,
	on_rightclick = item_spawn,
})

minetest.register_node("myitemchest:chest_storage", {
	description = "Storage Chest",
	tiles = {
		"myitemchest_chest_top.png",
		"myitemchest_chest_top.png",
		"myitemchest_chest_side.png^[transformFX",
		"myitemchest_chest_side.png",
		"myitemchest_chest_back.png",
		"myitemchest_chest_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "myitemchest:chest_storage",
	groups = {choppy = 2,not_in_creative_inventory=0},
	sounds = default.node_sound_wood_defaults(),
	node_box = closed_box,
	on_place = check_air,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local node = minetest.get_node(pos)
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "myitemchest:chest_formspec", param2 = node.param2})
	end,
	on_dig = dig_it,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local timer = minetest.get_node_timer(pos)
		timer:start(5)
		minetest.swap_node(pos, {name="myitemchest:chest_open_storage", param2=node.param2})
	end,
})

minetest.register_node("myitemchest:chest_open_storage", {
	description = "Chest Open",
	tiles = {
		"myitemchest_chest_open_top.png",
		"myitemchest_chest_open_top.png",
		"myitemchest_chest_side.png^[transformFx",
		"myitemchest_chest_side.png",
		"myitemchest_chest_back.png",
		"myitemchest_chest_front_open.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "myitemchest:chest_storage",
	groups = {choppy = 2,not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	node_box = open_box,
	selection_box = open_box,
	on_dig = dig_it,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.swap_node(pos, {name="myitemchest:chest_storage", param2=node.param2})
	end,
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	local node = minetest.get_node(pos)
	minetest.swap_node(pos, {name = "myitemchest:chest_storage", param2=node.param2})
	end,
})



minetest.register_node("myitemchest:chest_formspec", {
	description = "Chest fs",
	tiles = {
		"myitemchest_air.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	alpha = 100,
	drop = "myitemchest:chest_storage",
	groups = {choppy = 2,not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -1.4375, -0.25, 0.4375, -0.9125, 0.3125},
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	on_dig = function(pos, node, digger)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		local nodeu = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if inv:is_empty("main") == true then
			if nodeu.name == "myitemchest:chest_storage" or
				nodeu.name == "myitemchest:chest_open_storage" then
				minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
				minetest.remove_node(pos)
				minetest.spawn_item(pos,"myitemchest:chest_storage")
			end
		else return
		end
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from chest at " .. minetest.pos_to_string(pos))
	end,
})
