

minetest.register_node("bat_light:trafic_light", {
	description = "Trafic Light",
	tiles = {
		"bat_lanterntb.png",
		"bat_lanterntb.png",
		{name="bat_traficlight1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=10}},
		{name="bat_traficlight1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=10}},
		{name="bat_traficlight2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=10}},
		{name="bat_traficlight2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=10}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 1},
	light_source = 8,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
			{-0.25, -0.4375, 0.125, -0.125, 0.4375, 0.25}, 
			{-0.25, -0.4375, -0.25, -0.125, 0.4375, -0.125},
			{0.125, -0.4375, 0.125, 0.25, 0.4375, 0.25}, 
			{0.125, -0.4375, -0.25, 0.25, 0.4375, -0.125}, 
			{-0.3125, 0.4375, -0.3125, 0.3125, 0.5, 0.3125}, 
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, 
			{-0.25, 0.125, -0.25, 0.25, 0.1875, 0.25}, 
			{-0.25, -0.1875, -0.25, 0.25, -0.125, 0.25}, 
		}
	}
})
--craft
minetest.register_craft({
		output = "bat_light:trafic_light 1",
		recipe = {
			{'bat_blocks:bat_color_black','bat_blocks:bat_color_red','bat_blocks:bat_color_black'},
			{'bat_blocks:bat_color_black','bat_blocks:bat_color_yellow','bat_blocks:bat_color_black'},
			{'bat_blocks:bat_color_black','bat_blocks:bat_color_green','bat_blocks:bat_color_black'}
			}
})


