-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"bench_middle_top.png",
		"bench_middle_bottom.png",
		"bench_middle_right.png",
		"bench_middle_left.png",
		"bench_middle_front.png",
		"bench_middle_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, -0.0625, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.3125, 0.5, -0.0625, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.3125, -0.0625, -0.3125}, -- NodeBox3
			{0.3125, -0.5, -0.5, 0.5, -0.0625, -0.3125}, -- NodeBox4
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox5
			{-0.5, 0.4375, 0.125, 0.5, 0.5, 0.4375}, -- NodeBox6
			{-0.5, 0.25, 0.125, 0.5, 0.3125, 0.4375}, -- NodeBox7
			{-0.5, 0.125, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox8
			{-0.5, 0.0625, 0.125, 0.5, 0.125, 0.5}, -- NodeBox9
		}
	}
})

