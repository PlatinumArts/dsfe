local mysponge_table = { -- item, ,desc, image, scale, nodegroup, bright
{"sponge_dry",   "Dry Sponge",    "mysponge_sponge.png", "0.5", {dig_immediate=1, oddly_breakable_by_hand=1, flammable=1}},
{"sponge_moist", "Moist Sponge",  "mysponge_sponge2.png", "0.7", {dig_immediate=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1}},
{"sponge_wet",   "Wet Sponge",    "mysponge_sponge3.png", "1",   {dig_immediate=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1 }},
{"sponge_soaked","Soaked Sponge", "mysponge_sponge3.png", "1", {dig_immediate=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1}},
}
for i in ipairs(mysponge_table) do
	local item = mysponge_table[i][1]
	local desc = mysponge_table[i][2]
	local image = mysponge_table[i][3]
	local scale = mysponge_table[i][4]
	local nodegroup = mysponge_table[i][5]


minetest.register_node("mysponge:"..item,{
	description = desc,
	tiles = {image},
	drawtype = "nodebox",
	visual_scale = scale,
	paramtype = "light",
	groups = nodegroup,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			}
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25}, 
		}
	}
})

end

local air_nodes = {
	{"air1"},
	{"air2"},
	{"air3"},
	}
for i in ipairs(air_nodes) do
	local airnode = air_nodes[i][1]
minetest.register_node("mysponge:"..airnode,{
--	description = "Air 1",
	tiles = {"mysponge_air.png"},
	drawtype = "allfaces",
	walkable = false,
	pointable = false,
	paramtype = "light",
	groups = {not_in_creative_inventory=1}
})
end


minetest.register_node("mysponge:dry_leaves",{
	description = "Dry Leaves",
	tiles = {"mysponge_dry_leaves.png"},
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = {dig_immediate=1, oddly_breakable_by_hand=1}
})


-------------------------------------------------------------------------
--ABMs
-------------------------------------------------------------------------
--Set Air

--Air 1
minetest.register_abm({
	nodenames = {"group:water"},
	neighbors = {"mysponge:sponge_dry"},
	interval = 0.2,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:air1"})	
	end
})

--Air 2
minetest.register_abm({
	nodenames = {"group:water"},
	neighbors = {"mysponge:air1"},
	interval = 0.2,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:air2"})	
	end
})

--Air 3
minetest.register_abm({
	nodenames = {"group:water"},
	neighbors = {"mysponge:air2"},
	interval = 0.2,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:air3"})	
	end
})

-------------------------------------------------------------------------
--Set default Air
-------------------------------------------------------------------------

minetest.register_abm({
	nodenames = {"mysponge:air1","mysponge:air2","mysponge:air3"},
	interval = 4,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="air"})	
	end
})

-------------------------------------------------------------------------
--Set Sponge
-------------------------------------------------------------------------

minetest.register_abm({
	nodenames = {"mysponge:sponge_dry"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:sponge_soaked"})	
	end

})
------------------------------------------------------------------------------------------------
--Shrink Sponge in Air
------------------------------------------------------------------------------------------------
minetest.register_abm({
	nodenames = {"mysponge:sponge_soaked"},
	neighbors = {"air"},
	interval = 60,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:sponge_wet"})
	end,
})
minetest.register_abm({
	nodenames = {"mysponge:sponge_wet"},
	neighbors = {"air"},
	interval = 60,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:sponge_moist"})
	end,
})
minetest.register_abm({
	nodenames = {"mysponge:sponge_moist"},
	neighbors = {"air"},
	interval = 60,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="mysponge:sponge_dry"})
	end,
})


-------------------------------------------------------------------------------------------------
--Craft

minetest.register_craft({
		type = "cooking",
		output = "default:water_source 3",
		recipe = "mysponge:sponge_soaked",
		cooktime = 5,
		replacements = {{"mysponge:sponge_soaked", "mysponge:sponge_dry"}},
	})
minetest.register_craft({
		type = "cooking",
		output = "default:water_source 2",
		recipe = "mysponge:sponge_wet",
		cooktime = 5,
		replacements = {{"mysponge:sponge_wet", "mysponge:sponge_dry"}},
	})
minetest.register_craft({
		type = "cooking",
		output = "mysponge:dry_leaves",
		recipe = "group:leaves",
		cooktime = 3,
	})
minetest.register_craft({
		output = "mysponge:sponge_dry 1",
		recipe = {
			{"default:mese_crystal_fragment","mysponge:dry_leaves","default:mese_crystal_fragment"},
			{"mysponge:dry_leaves","default:mese_crystal_fragment","mysponge:dry_leaves"},
			{"default:mese_crystal_fragment","mysponge:dry_leaves","default:mese_crystal_fragment"},
			},
		cooktime = 3,
	})



