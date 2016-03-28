
local mypaint_stone_colors = {
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
	"default:cobble","default:desert_cobble","default:mossycobble",
	"default:stone","default:desert_stone",
	"default:stonebrick","default:desert_stonebrick"
}

for _, entry in ipairs(mypaint_stone_colors) do
	local color = entry[1]
	local desc = entry[2]
	local paint = "^[colorize:"..entry[3]
	local nici = entry[4]

-- Cobble
minetest.register_node(":default:cobble_" .. color, {
	description = desc .. " Cobble",
	tiles = {"default_cobble.png".. paint},
	groups = {cracky = 3, stone = 2, not_in_creative_inventory = nici},
	sounds = default.node_sound_stone_defaults(),
})

-- Desert Cobble
minetest.register_node(":default:desert_cobble_" .. color, {
	description = desc .. " Desert Cobble",
	tiles = {"default_desert_cobble.png".. paint},
	groups = {cracky = 3, stone = 2, not_in_creative_inventory = nici},
	sounds = default.node_sound_stone_defaults(),
})

-- Mossy Cobble
minetest.register_node(":default:mossycobble_" .. color, {
	description = desc .. "Mossy Cobble",
	tiles = {"default_mossycobble.png".. paint},
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_stone_defaults(),
})

-- Stone
minetest.register_node(":default:stone_" .. color, {
	description = desc .. " Stone",
	tiles = {"default_stone.png".. paint},
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Desert Stone
minetest.register_node(":default:desert_stone_" .. color, {
	description = desc .. " Desert Stone",
	tiles = {"default_desert_stone.png".. paint},
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Stone Brick
minetest.register_node(":default:stonebrick_" .. color, {
	description = desc .. " Stone Brick",
	tiles = {"default_stone_brick.png".. paint},
	groups = {cracky = 2, stone = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})

-- Desert Stone Brick
minetest.register_node(":default:desert_stonebrick_" .. color, {
	description = desc .. " Desert Stone Brick",
	tiles = {"default_desert_stone_brick.png".. paint},
	groups = {cracky = 2, stone = 1, not_in_creative_inventory = nici},
	sounds = default.node_sound_sand_defaults(),
})


end

local colors = {}
for _, entry in ipairs(mypaint_stone_colors) do
	table.insert(colors, entry[1])
end
	mypaint.register(paintables, colors)

