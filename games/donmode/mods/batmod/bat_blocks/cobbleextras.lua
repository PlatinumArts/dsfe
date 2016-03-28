

-- Bat Cobble Door Top M

minetest.register_node("bat_blocks:bat_cobble_door_top", {
	description = "Bat Cobble Door Top Middle",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_black.png",
            "bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble_door_top_m.png",
            "bat_cobble_door_top_m.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Bat Cobble Door Top L

minetest.register_node("bat_blocks:bat_cobble_door_top_l", {
	description = "Bat Cobble Door Top Left",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_black.png",
            "bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble_door_top_r.png",
            "bat_cobble_door_top_l.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Bat Cobble Door Top R

minetest.register_node("bat_blocks:bat_cobble_door_top_r", {
	description = "Bat Cobble Door Top Right",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_black.png",
            "bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble_door_top_l.png",
            "bat_cobble_door_top_r.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Bat Cobble Door Side R

minetest.register_node("bat_blocks:bat_cobble_door_side_r", {
	description = "Bat Cobble",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble.png",
            "bat_black.png",
            "bat_cobble_door_side_l.png",
            "bat_cobble_door_side_r.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Bat Cobble Door Side L

minetest.register_node("bat_blocks:bat_cobble_door_side_l", {
	description = "Bat Cobble",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_cobble.png",
            "bat_black.png",
            "bat_cobble.png",
            "bat_cobble_door_side_r.png",
            "bat_cobble_door_side_l.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})




--Crafting
---------------------------------------------------------------------------------------

--Cobble Door Top M

minetest.register_craft({
	output = "bat_blocks:bat_cobble_door_top 4",
	recipe = {
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_cobble', ''},
		{'bat_blocks:bat_tile', 'bat_blocks:bat_tile', ''}
	}
})

--Cobble Top Right

minetest.register_craft({
	output = "bat_blocks:bat_cobble_door_top_r 5",
	recipe = {
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_cobble', ''},
		{'bat_blocks:bat_tile', 'bat_blocks:bat_tile', 'bat_blocks:bat_tile'}
	}
})


--Cobble Top Left

minetest.register_craft({
	output = "bat_blocks:bat_cobble_door_top_l 5",
	recipe = {
		{'', 'bat_blocks:bat_cobble', 'bat_blocks:bat_cobble'},
		{'bat_blocks:bat_tile', 'bat_blocks:bat_tile', 'bat_blocks:bat_tile'}
	}
})
--Cobble Door Side Left

minetest.register_craft({
	output = "bat_blocks:bat_cobble_door_side_l 4",
	recipe = {
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_tile', ''},
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_tile', ''}
	}
})
--Cobble Door Side Right

minetest.register_craft({
	output = "bat_blocks:bat_cobble_door_side_r 4",
	recipe = {
		{'bat_blocks:bat_tile', 'bat_blocks:bat_cobble', ''},
		{'bat_blocks:bat_tile', 'bat_blocks:bat_cobble', ''}
	}
})
