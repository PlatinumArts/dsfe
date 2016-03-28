
-- Bat Cobble Tan Corner---------------------------------------------------------

minetest.register_node("bat_blocks:bat_cobble_tan_corner", {
	description = "Bat Cobble Tan Corner",
	drawtype = "normal",
    tiles = {"bat_cobble_tan.png",
            "bat_cobble_tan.png",
            "bat_cobble_tan.png",
            "bat_cobble_tan_l.png",
            "bat_cobble_tan.png",
            "bat_cobble_tan_r.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Craft

minetest.register_craft({
	output = "bat_blocks:bat_cobble_tan_corner 2",
	recipe = {
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_cobble_tan', ''},
		{'bat_blocks:bat_cobble', 'bat_blocks:bat_cobble_tan', ''}
	}
})

-- Bat Cobble Corner---------------------------------------------------------

minetest.register_node("bat_blocks:bat_cobble_corner", {
	description = "Bat Cobble Corner",
	drawtype = "normal",
    tiles = {"bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble.png",
            "bat_cobble_corner_l.png",
            "bat_cobble.png",
            "bat_cobble_corner_r.png",},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})


-- Craft

minetest.register_craft({
	output = "bat_blocks:bat_cobble_corner 2",
	recipe = {
		{'bat_blocks:bat_tile', 'bat_blocks:bat_tile', ''},
		{'bat_blocks:bat_tile', 'bat_blocks:bat_cobble', ''}
	}
})





