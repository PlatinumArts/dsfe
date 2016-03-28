

--cute light

minetest.register_node("cutepie:cute_light", {
	description = "Cutepie Light",
	tiles = {
		"cute_yellow.png",
		"cute_yellow.png",
		"cute_yellow.png",
		"cute_yellow.png",
		"cute_smile.png",
		"cute_smile.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2, snappy=2 , oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox1
			{-0.1875, -0.5, 0.375, 0.1875, 0.5, 0.5}, -- NodeBox2
			{-0.4375, -0.3125, 0.375, 0.4375, 0.3125, 0.5}, -- NodeBox3
			{-0.3125, -0.4375, 0.375, 0.3125, 0.4375, 0.5}, -- NodeBox4
		}
	}
})


