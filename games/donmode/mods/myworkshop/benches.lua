function minetest.get_myworkshop_formspec(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,7]"..
        "list[nodemeta:".. spos .. ";main;0.5,0.5;8,2;]"..
        "list[current_player;main;0.5,3;8,4;]"
    return formspec
end

local function has_myworkshop_privilege(meta, player)
    if player:get_player_name() ~= meta:get_string("owner") then
        return false
    end
    return true
end
minetest.register_node("myworkshop:bench_long", {
	description = "Long Bench",
	inventory_image = "myworkshop_bench_inv.png",
	tiles = {
		"myworkshop_bench_top_left.png",
		"myworkshop_bench_bottom.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.3125, -0.1875, -0.3125}, 
			{-0.5, -0.5, 0.3125, -0.3125, -0.1875, 0.5}, 
			{-0.5, -0.1875, -0.5, 0.5, 0.5, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 0.5, 0.5},
		}
	},
after_place_node = function(pos, placer)
      local dir = placer:get_look_dir()
      local right_pos = vector.new(pos)
      if math.abs(dir.x) < math.abs(dir.z) then
         right_pos.x = right_pos.x+dir.z/math.abs(dir.z)
      else
         right_pos.z = right_pos.z-dir.x/math.abs(dir.x)
      end
      local right_node = minetest.get_node(right_pos)
	if right_node.name == "air" then
      minetest.set_node(right_pos, {name="myworkshop:bench_long_right",param2 = minetest.dir_to_facedir(placer:get_look_dir())})
	end
        local meta = minetest.get_meta(pos)
        meta:set_string("owner", placer:get_player_name() or "")
        meta:set_string("infotext", "Work Bench (owned by "..
                meta:get_string("owner")..")")
end,

after_destruct = function(pos)
	if minetest.get_node({x=pos.x + 1, y=pos.y, z=pos.z}).name == "myworkshop:bench_long_right" then
      minetest.set_node({x=pos.x + 1, y=pos.y, z=pos.z}, {name="air"})
	end
	if minetest.get_node({x=pos.x - 1, y=pos.y, z=pos.z}).name == "myworkshop:bench_long_right" then
      minetest.set_node({x=pos.x - 1, y=pos.y, z=pos.z}, {name="air"})
	end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+ 1}).name == "myworkshop:bench_long_right" then
      minetest.set_node({x=pos.x, y=pos.y, z=pos.z + 1}, {name="air"})
	end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z - 1}).name == "myworkshop:bench_long_right" then
      minetest.set_node({x=pos.x, y=pos.y, z=pos.z - 1}, {name="air"})
	end
end,

    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Work Bench")
        meta:set_string("owner", "")
        local inv = meta:get_inventory()
        inv:set_size("main", 9*7)
    end,

    can_dig = function(pos,player)

	local meta = minetest.env:get_meta({x=pos.x,y=pos.y+1,z=pos.z});
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	


        local meta = minetest.get_meta(pos);
        local inv = meta:get_inventory()

        return inv:is_empty("main") and has_myworkshop_privilege(meta, player)
	


    end,
    allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        local meta = minetest.get_meta(pos)
        if not has_myworkshop_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a work bench belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return count
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        if not has_myworkshop_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a work bench belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return stack:get_count()
    end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        if not has_myworkshop_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a work bench belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return stack:get_count()
    end,
    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        minetest.log("action", player:get_player_name()..
                " moves stuff into work bench at "..minetest.pos_to_string(pos))
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name()..
                " moves stuff into work bench at "..minetest.pos_to_string(pos))
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name()..
                " takes stuff from work bench at "..minetest.pos_to_string(pos))
    end,
    on_rightclick = function(pos, node, clicker)
        local meta = minetest.get_meta(pos)
        if has_myworkshop_privilege(meta, clicker) then
            minetest.show_formspec(
                clicker:get_player_name(),
                "myworkshop:bench_long",
                minetest.get_myworkshop_formspec(pos)
            )
        end
    end,


})
minetest.register_node("myworkshop:bench_wshelf", {
	description = "Long Bench Middle",
	tiles = {
		"myworkshop_bench_middle_top.png",
		"myworkshop_bench_middle_bottom.png",
		"myworkshop_bench_middle_right.png",
		"myworkshop_bench_middle_left.png",
		"myworkshop_bench_middle_front.png",
		"myworkshop_bench_middle_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, -0.0625, 0.5}, 
			{0.3125, -0.5, 0.3125, 0.5, -0.0625, 0.5}, 
			{-0.5, -0.5, -0.5, -0.3125, -0.0625, -0.3125}, 
			{0.3125, -0.5, -0.5, 0.5, -0.0625, -0.3125}, 
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, 
			{-0.5, 0.4375, 0.125, 0.5, 0.5, 0.4375}, 
			{-0.5, 0.25, 0.125, 0.5, 0.3125, 0.4375},
			{-0.5, 0.125, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.0625, 0.125, 0.5, 0.125, 0.5}, 
		}
	}
})

minetest.register_node("myworkshop:bench_long_right", {
	description = "Long Bench Right",
	tiles = {
		"myworkshop_bench_top_right.png",
		"myworkshop_bench_bottom.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.5, 0.5, -0.1875, -0.3125}, 
			{0.3125, -0.5, 0.3125, 0.5, -0.1875, 0.5}, 
			{-0.5, -0.1875, -0.5, 0.5, 0.5, 0.5},  
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.0625, 0.0625},  
		}
	},
})

minetest.register_node("myworkshop:bench_wood_top", {
	description = "Wood Top Bench ",
	tiles = {
		"myworkshop_bench_top.png",
		"myworkshop_bench_bottom.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png",
		"myworkshop_bench_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, 
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, 
			{-0.5, 0.3125, -0.5, 0.5, 0.5, 0.5},  
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},  
		}
	}
})
