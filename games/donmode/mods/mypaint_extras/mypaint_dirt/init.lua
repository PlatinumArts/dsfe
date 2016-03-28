
local mypaint_dirt_colors = {
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
	"default:dirt","default:dirt_with_grass","default:dirt_with_dry_grass","default:dirt_with_snow"
}

for _, entry in ipairs(mypaint_dirt_colors) do
	local color = entry[1]
	local desc = entry[2]
	local paint = "^[colorize:"..entry[3]
	local nici = entry[4]

-- Dirt
minetest.register_node(":default:dirt_" .. color, {
	description = desc .. " Dirt",
	tiles = {"default_dirt.png".. paint},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_dirt_defaults(),
})

-- Dirt with Grass
minetest.register_node(":default:dirt_with_grass_" .. color, {
	description = desc .. " Dirt with Grass",
	tiles = {"default_grass.png"..paint, "default_dirt.png"..paint,
		{name = "default_dirt.png^default_grass_side.png"..paint,
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_dirt_defaults(),
})

-- Dirt with Dry Grass
minetest.register_node(":default:dirt_with_dry_grass_" .. color, {
	description = desc .. " Dirt with Dry Grass",
	tiles = {"default_dry_grass.png"..paint, "default_dirt.png"..paint,
		{name = "default_dirt.png^default_dry_grass_side.png"..paint,
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_dirt_defaults(),
})

-- Dirt with Snow
minetest.register_node(":default:dirt_with_snow_" .. color, {
	description = desc .. " Dirt with Snow",
	tiles = {"default_snow.png"..paint, "default_dirt.png"..paint,
		{name = "default_dirt.png^default_snow_side.png"..paint,
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_dirt_defaults(),
})


end

local colors = {}
for _, entry in ipairs(mypaint_dirt_colors) do
	table.insert(colors, entry[1])
end
	mypaint.register(paintables, colors)

