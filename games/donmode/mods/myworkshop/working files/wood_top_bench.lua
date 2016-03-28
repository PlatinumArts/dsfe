-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"bench_top.png",
		"bench_bottom.png",
		"bench_side.png",
		"bench_side.png",
		"bench_side.png",
		"bench_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, -0.0625, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.3125, 0.5, -0.0625, 0.5}, -- NodeBox2
			{0.3125, -0.5, -0.5, 0.5, -0.0625, -0.3125}, -- NodeBox3
			{-0.5, -0.5, -0.5, -0.3125, -0.0625, -0.3125}, -- NodeBox4
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox5
		}
	}
})

