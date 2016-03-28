-- Ceiling Block

minetest.register_node("bat_blocks:ceiling_block", {
	description = "Ceiling Tile Block",
	drawtype = "normal",
	tiles = {"bat_ceiling.png"},
	paramtype = "light",
	groups = {cracky = 2},

})

--Craft

minetest.register_craft({
	output = "bat_blocks:ceiling_block 2",
	recipe = {
		{"bat_blocks:bat_color_white","bat_blocks:bat_color_white",""},
		{"dye:grey","dye:grey",""},
		{"","",""}
		}	
})

--Ceiling Tile

minetest.register_node("bat_blocks:ceiling_tile",{
	description = "Ceiling Tile",
	drawtype="nodebox",
	tiles = {"bat_ceiling.png"},
	paramtype = "light",
	groups = {oddly_breakable_by_hand = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		}
	}
})

--Craft

minetest.register_craft({
	output = "bat_blocks:ceiling_tile 3",
	recipe = {
		{"bat_blocks:bat_color_white","",""},
		{"dye:grey","",""},
		{"","",""}
		}	
})
