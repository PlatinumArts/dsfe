minetest.register_craft({
	type = "shapeless",
	output = "default:gravel",
	recipe ={"default:cobble"},
})
minetest.register_craft({
	type = "shapeless",
	output = "default:sand",
	recipe ={"default:gravel"},
})
minetest.register_craft({
	type = "shapeless",
	output = "mycobble:desert_gravel",
	recipe ={"default:desert_cobble"},
})
minetest.register_craft({
	type = "shapeless",
	output = "default:desert_sand",
	recipe ={"mycobble:desert_gravel"},
})
minetest.register_node ("mycobble:desert_gravel",{
	description = "Desert Gravel",
	tiles = {"default_gravel.png^[colorize:#8A2908:120"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})
