-- cute cobble

minetest.register_node("cutepie:cute_cobble", {
	description = "Cutepie Cobble",
	drawtype = "normal",
	tiles = {"cute_cobble.png"},
	paramtype = "light",
	groups = {cracky = 2},

})

-- cute purple tile

minetest.register_node("cutepie:cute_purple_tile", {
	description = "Cutepie Purple Tile",
	drawtype = "normal",
	tiles = {"cute_purple_tile.png"},
	paramtype = "light",
	groups = {cracky = 2},

})

-- cute blocks

minetest.register_node("cutepie:cute_blocks", {
	description = "Cutepie Beans",
	light_source = 7,
	drawtype = "normal",
	tiles = {
		{name="cute_blocks_ani.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.8}},
		},
	paramtype = "light",
	groups = {cracky = 2},

})

-- cute rainbow

minetest.register_node("cutepie:cute_rainbow", {
	description = "Cutepie Rainbow",
	light_source = 11,
	drawtype = "normal",
	tiles = {
		{name="cute_rainbow.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.8}},
		},
	paramtype = "light",
	groups = {cracky = 2},

})

--Cute Cane

minetest.register_node("cutepie:cute_cane", {
	description = "Cutepie Cane",
	tiles = {
		"cute_cane.png",
		"cute_cane.png",
		"cute_cane.png",
		"cute_cane.png",
		"cute_cane.png",
		"cute_cane.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 2 , oddly_breakable_by_hand = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.1875, 0.25, 0.5, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.25, 0.1875, 0.5, 0.25}, -- NodeBox2
			{-0.125, -0.5, -0.3125, 0.125, 0.5, 0.3125}, -- NodeBox3
			{-0.3125, -0.5, -0.125, 0.3125, 0.5, 0.125}, -- NodeBox4
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.1875, 0.25, 0.5, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.25, 0.1875, 0.5, 0.25}, -- NodeBox2
			{-0.125, -0.5, -0.3125, 0.125, 0.5, 0.3125}, -- NodeBox3
			{-0.3125, -0.5, -0.125, 0.3125, 0.5, 0.125}, -- NodeBox4
		}
	}
})
