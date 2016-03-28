
-- Bat Rope

minetest.register_node("bat_ladders:bat_rope", {
	description = "Bat Rope",
	paramtype = "light",
	walkable = false,
	climbable = true,
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),

	tiles = {
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
		}
	}
})

minetest.register_craft({
	output = 'bat_ladders:bat_rope 3',
	recipe = {
		{'bat_blocks:bat_rubber_raw', '', ''},
		{'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_glue', ''},
		{'bat_blocks:bat_rubber_raw', '', ''}
	}
})

--Rope Box
------------------------------------------------------------------------------


minetest.register_node("bat_ladders:bat_rope_for_box", {
    description = "Rope for Ropebox",
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
	tiles = {
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png",
		"bat_rubber_rope.png"
	},
    groups = {not_in_creative_inventory=1},
    climbable = true,
    walkable = false,
    diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
		}
	},
    after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
        if node.name == "bat_ladders:bat_rope_for_box" then 
            minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
        end
    end,
})

minetest.register_node("bat_ladders:bat_ropebox", {
    description = "Ropebox Block",
    drawtype = "nodebox",
    sunlight_propagates = true,
    tiles = {"bat_tree_trunk.png",
             "bat_tree_trunk.png",
             "bat_tree_trunk.png",
             "bat_tree_trunk.png",
             "bat_tree_trunk.png",
             "bat_tree_trunk.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16}, 
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16}, 
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16}, 
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16},    
		},
	},
    after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
        if node.name == "bat_ladders:bat_rope_for_box" then 
            minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
        end
    end,
})

minetest.register_abm({
	nodenames = {"bat_ladders:bat_ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
	        minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="bat_ladders:bat_rope_for_box"})
	end
})

minetest.register_abm({
	nodenames = {"bat_ladders:bat_rope_for_box"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
	        minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="bat_ladders:bat_rope_for_box"})
	end
})

minetest.register_craft({
	output = "bat_ladders:bat_ropebox",
	recipe = {
		{"bat_blocks:bat_color_black"},
		{"bat_ladders:bat_rope"},
		{"bat_ladders:bat_rope"},
	}
})
