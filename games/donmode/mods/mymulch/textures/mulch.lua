local mulch_tab = {
{"black", "Black", "mymulch_black.png"},
{"blue", "Blue", "mymulch_blue.png"},
{"brown", "Brown", "mymulch_brown.png"},
{"cyan", "Cyan", "mymulch_cyan.png"},
{"dark_green", "Dark Green", "mymulch_dark_green.png"},
{"dark_grey", "Dark Grey", "mymulch_dark_grey.png"},
{"green", "Green", "mymulch_green.png"},
{"grey", "Grey", "mymulch_grey.png"},
{"magenta", "Magenta", "mymulch_magenta.png"},
{"orange", "Orange", "mymulch_orange.png"},
{"pink", "Pink", "mymulch_pink.png"},
{"red", "Red", "mymulch_red.png"},
{"violet", "Violet", "mymulch_violet.png"},
{"white", "White", "mymulch_white.png"},
{"yellow", "Yellow", "mymulch_yellow.png"},
{"tan", "Tan", "mymulch_tan.png"},
}
for i in ipairs (mulch_tab) do
	local mat = mulch_tab[i][1]
	local desc = mulch_tab[i][2]
	local image = mulch_tab[i][3]


minetest.register_node("mymulch:mulch_"..mat, {
	description = desc.." Mulch",
	drawtype = "normal",
	tiles = {
		"mymulch_tan.png^[colorize:"..mat..":120"
		},
	paramtype = "light",
	is_ground_content = true,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly = 2, falling_node=1, not_in_creative_inventory=1, soil=1, mulch = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


end


















