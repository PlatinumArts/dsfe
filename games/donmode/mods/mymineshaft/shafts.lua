minetest.register_alias("myshafts:minenode", "mymineshaft:minenode")
---[[
minetest.register_abm({
	nodenames = {"mymineshaft:minenode"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local rand = math.random(1,14)
		local schem = minetest.get_modpath("mymineshaft").."/schems/myshafts"..rand..".mts"
		if rand <= 10 then
			minetest.place_schematic({x=pos.x-3,y=pos.y,z=pos.z-3},schem,0, "air", true)
		elseif rand >= 11 then
			minetest.place_schematic({x=pos.x-3,y=pos.y-30,z=pos.z-3},schem,0, "air", true)
		end
	end,
})
--]]
minetest.register_node("mymineshaft:minenode",{
	description = "Minenode",
	tiles = {"default_cobble.png^default_snowball.png"},
	drawtype = "normal",
	paramtype = "light",
	light_source = 8,
	groups = {cracky = 1},
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymineshaft:minenode",
	wherein        = "default:stone",
	clust_scarcity = 80*80*80,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -1000,
	height_max     = -100,
})

local function coins(pos)
  	minetest.add_particlespawner(50, 0.4,
		pos, pos,
		{x=2, y=0.2, z=2}, {x=-2, y=2, z=-2},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.5, 2,
		0.2, 5,
		true, "mymineshaft_coin.png")
end
minetest.register_node("mymineshaft:cave3",{
	description = "Mining Chest",
	drawtype = "mesh",
	mesh = "mymineshaft_chest.obj",
	tiles = {"mymineshaft_chest.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	drop = {
		max_items = 2,
		items = {
		{
		items = {"default:diamond 2"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal 3"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump 10"},
		rarity = 3,
		},
		{
		items = {"default:goldblock 1"},
		rarity = 30,
		},
		{
		items = {"default:wood 20"},
		rarity = 1,
		},
		{
		items = {"default:pick_diamond 1"},
		rarity = 25,
		},
		{
		items = {"default:pick_steel 1"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked 1"},
		rarity = 15,
		},
		{
		items = {"wool:white 5"},
		rarity = 3,
		},
		{
		items = {"default:tree 3"},
		rarity = 3,
		},
		{
		items = {"default:papyrus 5"},
		rarity = 3,
		},

		},
	},
on_destruct = coins,
})





