
local bblocks = {
	{"Bat Pavers", 					"bat_pavers"},
	{"Bat Block", 					"bat_block"},
	{"Bat Tile", 					"bat_tile"},
	{"Black with Bat", 				"bat_black_wbat"},
	{"Bat Diagonal", 				"bat_diag"},
	{"Bat X", 						"bat_x"},
	{"Bat Brick", 					"bat_brick"},
	{"Bat Small Brick", 			"bat_smbrick"},
	{"Bat Checker", 				"bat_checker"},
	{"Bat Checker Small", 			"bat_checker_sm"},
	{"Bat Checker White", 			"bat_checker_white"},
	{"Bat Checker White Small", 	"bat_checker_sm_white"},
	{"Bat Cobble", 					"bat_cobble"},
	{"Bat Cobble White", 			"bat_cobble_white"},
	{"Bat Cobble Tan", 				"bat_cobble_tan"},
	{"Bat Color Black", 			"bat_color_black"},
	{"Bat Color Yellow", 			"bat_color_yellow"},
	{"Bat Color White", 			"bat_color_white"},
	{"Bat Color Beige", 			"bat_color_beige"},
	{"Bat Color Green", 			"bat_color_green"},
	{"Bat Color Blue", 				"bat_color_blue"},
	{"Bat Color Red", 				"bat_color_red"},
	{"Bat Color Orange", 			"bat_color_orange"},
	}
for i in ipairs(bblocks) do
local des = bblocks[i][1]
local itm = bblocks[i][2]

minetest.register_node("bat_blocks:"..itm, {
	description = des,
	drawtype = "normal",
    tiles = {itm..".png"},
	paramtype = "light",
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),

})
end

-- Craft

minetest.register_craft({
	output = "bat_blocks:bat_pavers 5",
	recipe = {
		{'bat_blocks:bat_block', 'bat_blocks:bat_block', ''},
		{'', 'bat_blocks:bat_block', 'bat_blocks:bat_block'},
		{'','','bat_blocks:bat_block'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_block 9",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_tile 4",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_black_wbat 1",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_diag 6",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_x 3",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow'},
		{'bat_blocks:bat_color_black','bat_blocks:bat_color_yellow','bat_blocks:bat_color_black'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_brick 4",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_smbrick 4",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_checker 4",
	recipe = {
		{'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', ''},
		{'','',''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_checker_sm 6",
	recipe = {
		{'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_yellow','bat_blocks:bat_color_black','bat_blocks:bat_color_yellow'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_checker_white 4",
	recipe = {
		{'bat_blocks:bat_color_white', 'bat_blocks:bat_color_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_white', ''},
		{'','',''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_checker_sm_white 4",
	recipe = {
		{'bat_blocks:bat_color_white', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_white'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_white', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_white','bat_blocks:bat_color_black','bat_blocks:bat_color_white'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_cobble 2",
	recipe = {
		{'bat_blocks:bat_color_black', 'default:cobble', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_cobble_white 1",
	recipe = {
		{'bat_blocks:bat_cobble', 'dye:white', 'dye:white'}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_cobble_tan 2",
	recipe = {
		{'bat_blocks:bat_cobble_white', 'default:sand', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_black 2",
	recipe = {
		{'default:stone', 'dye:black', ''},
		{'dye:black', 'default:stone', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_yellow 2",
	recipe = {
		{'default:stone', 'dye:yellow', ''},
		{'dye:yellow', 'default:stone', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_white 1",
	recipe = {
		{'bat_blocks:bat_white_powder', 'bat_blocks:bat_color_yellow', ''},
		{'bat_blocks:bat_color_yellow', 'bat_blocks:bat_white_powder', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_beige",
	recipe = {
		{"bat_blocks:bat_cobble_white","default:sand"}
		}	
})

minetest.register_craft({
	output = "bat_blocks:bat_color_green 2",
	recipe = {
		{'default:stone', 'dye:green', ''},
		{'dye:green', 'default:stone', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_red 2",
	recipe = {
		{'default:stone', 'dye:red', ''},
		{'dye:red', 'default:stone', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_blue 2",
	recipe = {
		{'default:stone', 'dye:blue', ''},
		{'dye:blue', 'default:stone', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_color_orange 2",
	recipe = {
		{'default:stone', 'dye:orange', ''},
		{'dye:orange', 'default:stone', ''}
	}
})

