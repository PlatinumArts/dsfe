-- Bat Mod by Batman --
--===========================================

--
-- register nodes:
--


doors.register_door("bat_blocks:bat_door", {
	description = "Bat Door",
	inventory_image = "batdoor_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles = {"batdoor.png"},
	protected = true,
})

minetest.register_craft({
	output = "bat_blocks:bat_door",
	recipe = {
		{"bat_blocks:bat_color_black", "default:tree"},
		{"default:tree", "bat_blocks:bat_rod_black"},
		{"bat_blocks:bat_color_black", "default:tree"}
	}
})

--Unlocked Door

doors.register_door("bat_blocks:bat_door_unlocked", {
	description = "Bat Door Unlocked",
	inventory_image = "batdoor_unlocked_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles = {"batdoor_unlocked.png"},
	protected = false,
})

minetest.register_craft({
	output = "bat_blocks:bat_door_unlocked",
	recipe = {
		{"bat_blocks:bat_color_black", "default:tree"},
		{"default:tree", "bat_blocks:bat_color_black"},
		{"bat_blocks:bat_color_black", "default:tree"}
	}
})
----trapdoor----

local function update_node(pos, node) 
	minetest.set_node(pos, node)
end

local function punch(pos)
	local meta = minetest.get_meta(pos)
	local state = meta:get_int("state")
	local me = minetest.get_node(pos)
	local tmp_node
	local tmp_node2
	oben = {x=pos.x, y=pos.y, z=pos.z}
		if state == 1 then
			state = 0
			tmp_node = {name="bat_blocks:bat_trapdoor", param1=me.param1, param2=me.param2}
		else
			state = 1
			tmp_node = {name="bat_blocks:bat_trapdoor_open", param1=me.param1, param2=me.param2}
		end
		update_node(pos, tmp_node)
		meta:set_int("state", state)
end
minetest.register_node("bat_blocks:bat_trapdoor", {
	description = "Trapdoor",
	inventory_image = "bat_trapdoor.png",
	drawtype = "nodebox",
	tiles = {"bat_trapdoor.png", "bat_trapdoor.png",  "bat_trap_side.png",  "bat_trap_side.png", "bat_trap_side.png", "bat_trap_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	sounds = default.node_sound_wood_defaults(),
	drop = "bat_blocks:bat_trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},

	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_node("bat_blocks:bat_trapdoor_open", {
	drawtype = "nodebox",
	tiles = {"bat_trap_side.png", "bat_trap_side.png",  "bat_trap_side.png",  "bat_trap_side.png", "bat_trapdoor.png", "bat_trapdoor.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	pointable = true,
	stack_max = 0,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	climbable = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "bat_blocks:bat_trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_craft({
	output = 'bat_blocks:bat_trapdoor 2',
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_rod_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_rod_black', ''},
		{'', '', ''},
	}
})
