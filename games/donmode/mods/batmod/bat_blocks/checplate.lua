
--ChecPlate-----------------------------------------------------------------------------------------------

minetest.register_node("bat_blocks:bat_checplate", {
	description = "Bat Checker Plate",
	drawtype = "nodebox",
		tiles = {
		"bat_checplate.png",
		"bat_checplate_side.png",
		"bat_checplate_side.png",
		"bat_checplate_side.png",
		"bat_checplate_side.png",
		"bat_checplate_side.png"
	},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			}
		   },
	inventory_image = "bat_checplate.png",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})

-- Craft

minetest.register_craft({
	output = "bat_blocks:bat_checplate 9",
	recipe = {
		{'bat_blocks:bat_block', 'dye:grey', 'dye:grey'}
	}
})

--ChecPlate Block----------------------------------------------------------------------------------

minetest.register_node("bat_blocks:bat_checplate_block", {
	description = "Bat Checker Plate Block",
	drawtype = "normal",
		tiles = {
		"bat_checplate.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})
-- Craft

minetest.register_craft({
	output = "bat_blocks:bat_checplate_block 9",
	recipe = {
		{'','bat_blocks:bat_checplate', ''},
		{'bat_blocks:bat_checplate', 'bat_blocks:bat_checplate', 'bat_blocks:bat_checplate'},
		{'','bat_blocks:bat_checplate', ''},
	}
})
