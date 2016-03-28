-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"bench_top_right.png",
		"bench_bottom.png",
		"bench_side.png",
		"bench_side.png",
		"bench_side.png",
		"bench_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.5, 0.5, -0.1875, -0.3125}, -- NodeBox1
			{0.3125, -0.5, 0.3125, 0.5, -0.1875, 0.5}, -- NodeBox2
			{-0.5, -0.1875, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
		}
	}
})

