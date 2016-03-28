

-- Not Walkable Fake Lava

--remove the -- from the next line and add it to the following line to replace the default lava

--minetest.register_node(":default:lava_source", {

minetest.register_node("bat_blocks:bat_lava_nw", {
	description = "Bat Lava Not Walkable",
	drawtype = "allfaces",
	tiles = {"bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = LIGHT_MAX-1,
	paramtype2 = "facedir",
	walkable = false,
	groups = {snappy = 2, cracky = 2, dig_immediate = 3},
	sounds = default.node_sound_stone_defaults(),

})

minetest.register_alias("batmod:bat_lava_nw", "bat_blocks:bat_lava_nw")

-- Walkable Fake Lava

minetest.register_node("bat_blocks:bat_lava_w", {
	description = "Bat Lava Walkable",
	drawtype = "allfaces",
	tiles = {"bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png","bat_lava.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = LIGHT_MAX-1,
	paramtype2 = "facedir",
	walkable = true,
	groups = {snappy = 2, cracky = 2, dig_immediate = 3},
	sounds = default.node_sound_stone_defaults(),

})

minetest.register_alias("batmod:bat_lava_w", "bat_blocks:bat_lava_w")
	


-- Crafts

minetest.register_craft({
	output = 'bat_blocks:bat_lava_nw',
	recipe = {
		{'default:stone','default:mese_crystal'},
		{'dye:red','default:torch'},
		}
})

minetest.register_craft({
	output = 'bat_blocks:bat_lava_w',
	recipe = {
		{'default:cobble','default:mese_crystal'},
		{'dye:red','default:torch'},
		}
})


