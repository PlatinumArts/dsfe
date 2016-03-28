
mypaint_sample = {}

mypaint_sample.colors = {
	{"black",      "Black",      "#000000b0"},
	{"blue",       "Blue",       "#015dbb70"},
	{"brown",      "Brown",      "#a78c4570"},
	{"cyan",       "Cyan",       "#01ffd870"},
	{"darkgreen", "Dark Green",  "#005b0770"},
	{"darkgrey",  "Dark Grey",   "#303030b0"},
	{"green",      "Green",      "#61ff0170"},
	{"grey",       "Grey",       "#5b5b5bb0"},
	{"magenta",    "Magenta",    "#ff05bb70"},
	{"orange",     "Orange",     "#ff840170"},
	{"pink",       "Pink",       "#ff65b570"},
	{"red",        "Red",        "#ff000070"},
	{"violet",     "Violet",     "#2000c970"},
	{"white",      "White",      "#abababc0"},
	{"yellow",     "Yellow",     "#e3ff0070"},
}

local paintables = {
	"mypaint_sample:sand"
}

for _, entry in ipairs(mypaint_sample.colors) do
	local color = entry[1]
	local desc = entry[2]
	local paint = "^[colorize:"..entry[3]

minetest.register_node("mypaint_sample:sand_" .. color, {
	description = desc .. " Sample Block",
	tiles = {"default_sand.png".. paint},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2,cracky = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "mypaint_sample:sand_".. color .. " 2",
	recipe = {
		{"group:sand","group:sand"},
	}
})

end
if minetest.get_modpath("mypaint") then
local colors = {}
for _, entry in ipairs(mypaint_sample.colors) do
	table.insert(colors, entry[1])
end
	mypaint.register(paintables, colors)
end
