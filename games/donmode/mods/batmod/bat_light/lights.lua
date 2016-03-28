
--Bat Light
--------------------------------------------------------------------------------
minetest.register_node("bat_light:bat_light", {
	description = "Bat Light",
	tiles = {"bat_color_yellow.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.25, 0.3125, 0.125, 0.25, 0.5},
			{-0.5, -0.0625, 0.3125, 0.5, 0.0625, 0.5},
			{-0.5, -0.25, 0.3125, -0.375, 0.25, 0.5},
			{0.375, -0.3125, 0.3125, 0.5, 0.25, 0.5},
			{-0.4375, 0.25, 0.3125, -0.3125, 0.375, 0.5},
			{-0.4375, -0.375, 0.3125, -0.3125, -0.25, 0.5},
			{0.3125, 0.25, 0.3125, 0.4375, 0.375, 0.5},
			{0.3125, -0.375, 0.3125, 0.4375, -0.25, 0.5},
			{-0.0625, -0.375, 0.3125, 0.0625, -0.25, 0.5},
			{-0.125, 0.25, 0.3125, -0.0625, 0.375, 0.5},
			{0.0625, 0.25, 0.3125, 0.125, 0.375, 0.5},
		}
	}
})


--Crafts
---------------------------------------------------
--Bat Light
minetest.register_craft({
	output = "bat_light:bat_light 3",
	recipe = {
		{'bat_glass:bat_glass', 'bat_glass:bat_glass2', ''},
		{'', '', ''},
		{'', '', ''}
	}
})


--Lantern
---------------------------------------------------------------------------------

minetest.register_node("bat_light:bat_lantern", {
	description = "Bat Lantern",
	tiles = {
		"bat_lanterntb.png",
		"bat_lanterntb.png",
		"bat_lanternside.png",
		"bat_lanternside.png",
		"bat_lanternside.png",
		"bat_lanternside.png"
	},
	sunlight_propagates = true,
	walkable = true,
	light_source = 14,
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.4375, -0.3125, 0.3125, -0.3125, 0.3125},
			{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
			{-0.3125, -0.375, -0.3125, -0.1875, 0.375, -0.1875},
			{-0.3125, -0.375, 0.1875, -0.1875, 0.375, 0.3125},
			{0.1875, -0.375, 0.1875, 0.3125, 0.375, 0.3125},
			{0.1875, -0.375, -0.3125, 0.3125, 0.375, -0.1875},
			{-0.4375, 0.375, -0.4375, 0.4375, 0.1875, 0.4375},
		}
	}
})
--craft
minetest.register_craft({
		output = "bat_light:bat_lantern 1",
		recipe = {
			{'','bat_blocks:bat_color_black',''},
			{'bat_blocks:bat_color_black','bat_blocks:bat_color_white','bat_blocks:bat_color_black'},
			{'','default:torch',''}
			}
})
minetest.register_node("bat_light:bat_lantern_sm", {
	description = "Bat Lantern Small",
	paramtype = "light",
	groups = {cracky = 1},
	tiles = {
		"bat_lanterntb.png",
		"bat_lanterntb.png",
		{name="bat_streetlight.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
		{name="bat_streetlight.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
		{name="bat_streetlight.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
		{name="bat_streetlight.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
	},
	drawtype = "nodebox",
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.3125, -0.125, 0.125, 0.3125, 0.125}, 
			{-0.1875, -0.25, -0.1875, 0.1875, -0.125, -0.125}, 
			{-0.1875, -0.25, 0.125, 0.1875, -0.125, 0.1875}, 
			{-0.1875, -0.25, -0.1875, -0.125, -0.125, 0.1875}, 
			{0.125, -0.25, -0.1875, 0.1875, -0.125, 0.125}, 
			{-0.1875, 0.125, 0.125, 0.1875, 0.25, 0.1875}, 
			{-0.1875, 0.125, -0.1875, 0.1875, 0.25, -0.125}, 
			{0.125, 0.125, -0.1875, 0.1875, 0.25, 0.1875}, 
			{-0.1875, 0.125, -0.1875, -0.125, 0.25, 0.1875}, 
			{-0.0625, -0.3125, -0.0625, 0.0625, 0.5, 0.0625}, 
			{0.125, -0.125, 0.125, 0.1875, 0.1875, 0.1875}, 
			{0.125, -0.25, -0.1875, 0.1875, 0.25, -0.125},
			{-0.1875, -0.1875, -0.1875, -0.125, 0.25, -0.125}, 
			{-0.1875, -0.1875, 0.125, -0.125, 0.25, 0.1875}, 
			{-0.25, 0.1875, -0.25, 0.25, 0.25, 0.25}, 
		}
	}
})
--craft
minetest.register_craft({
		output = "bat_light:bat_lantern_sm 1",
		recipe = {
			{'','bat_blocks:bat_color_black',''},
			{'','bat_blocks:bat_color_white',''},
			{'','default:torch',''}
			}
})
--Sewer Light
--------------------------------------------------------------------------------
minetest.register_node("bat_light:sewer_light", {
	description = "Sewer Light",
	tiles = {"sewer_light.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy=2},
	sunlight_propagates = true,
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, 0.125, -0.125, 0.125, 0.5, 0.125},
			{-0.1875, 0.1875, -0.0625, 0.1875, 0.5, 0.0625},
			{-0.0625, 0.1875, -0.1875, 0.0625, 0.5, 0.1875},
		}
	},

})
--Craft
minetest.register_craft({
	output = "bat_light:sewer_light 9",
	recipe = {
		{'', 'bat_blocks:bat_color_yellow', ''},
		{'', 'default:torch', ''},
		{'', '', ''}
	}
})
