
local mypaint_sand_colors = {
	{"black",      "Black",      "#000000b0",1},
	{"blue",       "Blue",       "#015dbb70",1},
	{"brown",      "Brown",      "#a78c4570",1},
	{"cyan",       "Cyan",       "#01ffd870",1},
	{"darkgreen", "Dark Green",  "#005b0770",1},
	{"darkgrey",  "Dark Grey",   "#303030b0",1},
	{"green",      "Green",      "#61ff0170",1},
	{"grey",       "Grey",       "#5b5b5bb0",1},
	{"magenta",    "Magenta",    "#ff05bb70",1},
	{"orange",     "Orange",     "#ff840170",1},
	{"pink",       "Pink",       "#ff65b570",1},
	{"red",        "Red",        "#ff000070",1},
	{"violet",     "Violet",     "#2000c970",1},
	{"white",      "White",      "#abababc0",1},
	{"yellow",     "Yellow",     "#e3ff0070",1},
}

local paintables = {
	"default:sand","default:desert_sand","default:sandstone","default:sandstonebrick"
}

for _, entry in ipairs(mypaint_sand_colors) do
	local color = entry[1]
	local desc = entry[2]
	local paint = "^[colorize:"..entry[3]
	local nici = entry[4]


-- Sand
minetest.register_node(":default:sand_" .. color, {
	description = desc .. " Sand",
	tiles = {"default_sand.png".. paint},
	groups = {crumbly = 3, falling_node = 1, sand = 1,cracky = 2, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Desert Sand
minetest.register_node(":default:desert_sand_" .. color, {
	description = desc .. " Desert Sand",
	tiles = {"default_desert_sand.png".. paint},
	groups = {crumbly = 3, falling_node = 1, sand = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Sandstone
minetest.register_node(":default:sandstone_" .. color, {
	description = desc .. " Sandstone",
	tiles = {"default_sandstone.png".. paint},
	groups = {crumbly = 2, cracky = 3, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Sandstone Brick
minetest.register_node(":default:sandstonebrick_" .. color, {
	description = desc .. " Sandstone Brick",
	tiles = {"default_sandstone_brick.png".. paint},
	groups = {crumbly = 2, cracky = 3, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})



end

local colors = {}
for _, entry in ipairs(mypaint_sand_colors) do
	table.insert(colors, entry[1])
end
	mypaint.register(paintables, colors)

