
--Bat Black Framed

minetest.register_node("bat_glass:bat_glass_framed_black", {
	description = "Bat Glass Framed Black",
	drawtype = "glasslike_framed",
	tiles = {"bat_black_frame.png","bat_glass_glass.png"},
	paramtype = "light",
	groups = {cracky = 2,oddly_breakable_by_hand=3},
	stack_max = 500,
	sounds = default.node_sound_glass_defaults(),

})

--Bat Glass Yellow Framed

minetest.register_node("bat_glass:bat_glass_framed_yellow", {
	description = "Bat Glass Framed Yellow",
	drawtype = "glasslike_framed",
	tiles = {"bat_yellow_frame.png","bat_glass_glass.png"},
	paramtype = "light",
	groups = {cracky = 2,oddly_breakable_by_hand=3},
	stack_max = 500,
	sounds = default.node_sound_glass_defaults(),

})

--Bat Glass White Framed

minetest.register_node("bat_glass:bat_glass_framed_white", {
	description = "Bat Glass Framed White",
	drawtype = "glasslike_framed",
	tiles = {"bat_white_frame.png","bat_glass_glass.png"},
	paramtype = "light",
	groups = {cracky = 2,oddly_breakable_by_hand=3},
	stack_max = 500,
	sounds = default.node_sound_glass_defaults(),

})

--Bat Framed Glass

minetest.register_node("bat_glass:bat_glass_framed_bat", {
	description = "Bat Glass Framed Bat",
	drawtype = "glasslike_framed",
	tiles = {"bat_glass_frame.png","bat_glass_glass.png"},
	paramtype = "light",
	groups = {cracky = 2,oddly_breakable_by_hand=3},
	stack_max = 500,
	sounds = default.node_sound_glass_defaults(),

})


--Crafts
-- Bat Glass Framed Black

minetest.register_craft({
	output = "bat_glass:bat_glass_framed_black 2",
	recipe = {
		{'bat_glass:bat_glass_black', 'bat_blocks:bat_glue', ''}
	}
})
-- Bat Glass Framed White

minetest.register_craft({
	output = "bat_glass:bat_glass_framed_white 2",
	recipe = {
		{'bat_glass:bat_glass_white', 'bat_blocks:bat_glue', ''}
	}
})
-- Bat Glass Framed Yellow

minetest.register_craft({
	output = "bat_glass:bat_glass_framed_yellow 2",
	recipe = {
		{'bat_glass:bat_glass_yellow', 'bat_blocks:bat_glue', ''}
	}
})
-- Bat Glass Framed Bat

minetest.register_craft({
	output = "bat_glass:bat_glass_framed_bat 2",
	recipe = {
		{'bat_blocks:bat_checker', 'default:glass', ''}
	}
})
