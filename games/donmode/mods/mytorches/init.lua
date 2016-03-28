local torch_timer = 60

minetest.override_item("default:torch", {
	description = "Torch",
	inventory_image = "",
	wield_image = "",
	tiles = {
		{name="mytorches_torch_top.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		"mytorches_torch_bottom.png",
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:torch",
	light_source = 14,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.03, 0.0625, 0.4375, 0.03},
			{-0.03, -0.5, -0.0625, 0.03, 0.4375, 0.0625},
			{-0.03, 0.3125, -0.03, 0.03, 0.5, 0.03},
			{-0.095, 0.125, -0.0625, 0.095, 0.375, 0.0625},
			{-0.0625, 0.125, -0.095, 0.0625, 0.3125, 0.095},
		}
	},
on_place = function(itemstack, placer, pointed_thing)
	local timer = minetest.get_node_timer(pointed_thing.above)
		timer:start(torch_timer)
	if pointed_thing.type ~= "node" then
		return itemstack
	end

	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local dir = {
		x = p1.x - p0.x,
		y = p1.y - p0.y,
		z = p1.z - p0.z
		}
--	if p1 == "air" then
		if p0.y>p1.y then
			minetest.add_node(p1, {name="mytorches:torch_ceiling"})
		elseif p0.y<p1.y then
			minetest.add_node(p1, {name="default:torch"})
		else
			minetest.add_node(p1, {name="mytorches:torch_wall", param2=minetest.dir_to_facedir(placer:get_look_dir())})
		end
--	end
	itemstack:take_item()
		return itemstack
end,
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_med"})
	timer:start(torch_timer)
	end,
})
minetest.register_node("mytorches:torch_wall", {
--	description = "Torch",
	tiles = {
		{name="mytorches_torch_top2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		"mytorches_torch_bottom2.png",
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch1.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:torch",
	light_source = 14,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.125, -0.03, 0.0625, 0.4375, 0.03},
			{-0.03, 0.3125, -0.03, 0.03, 0.5, 0.03},
			{-0.095, 0.125, -0.0625, 0.095, 0.375, 0.0625},
			{-0.0625, 0.125, -0.095, 0.0625, 0.3125, 0.00},
			{-0.03, 0.125, -0.0625, 0.03, 0.4375, 0.0625},
			{-0.0625, 0.0625, -0.0625, 0.0625, 0.1875, 0.0625},
			{-0.0625, 0, 0, 0.0625, 0.125, 0.125},
			{-0.0625, -0.0625, 0.0625, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.125, 0.125, 0.0625, 0, 0.25},
			{-0.0625, -0.1875, 0.1875, 0.0625, -0.0625, 0.3125},
			{-0.0625, -0.25, 0.25, 0.0625, -0.125, 0.375},
			{-0.0625, -0.3125, 0.3125, 0.0625, -0.1875, 0.4375},
			{-0.0625, -0.375, 0.375, 0.0625, -0.25, 0.5},
		}
	},
	on_timer = function(pos, elapsed)
	local node = minetest.get_node(pos)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_med_wall", param2 = node.param2})
	timer:start(torch_timer)
	end,

})
minetest.register_node("mytorches:torch_ceiling", {
--	description = "Torch",
	tiles = {
		"mytorches_torch_bottom.png",
		{name="mytorches_torch_top.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch2.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:torch",
	walkable = false,
	light_source = 14,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.4375, -0.03, 0.0625, 0.5, 0.03},
			{-0.03, -0.4375, -0.0625, 0.03, 0.5, 0.0625},
			{-0.095, -0.125, -0.0625, 0.095, -0.375, 0.0625},
			{-0.0625, -0.125, -0.095, 0.0625, -0.3125, 0.095},
			
		}
	},
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_med_ceiling"})
	timer:start(torch_timer)
	end,
})
----------------------------------------------------------------------
minetest.register_node("mytorches:torch_med", {
	description = "Torch",
	inventory_image = "",
	wield_image = "",
	tiles = {
		{name="mytorches_torch_top.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		"mytorches_torch_bottom.png",
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:torch",
	light_source = 11,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.03, 0.0625, 0.25, 0.03},
			{-0.03, -0.5, -0.0625, 0.03, 0.25, 0.0625},
		}
	},
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_dim"})
	timer:start(torch_timer)
	end,
})
minetest.register_node("mytorches:torch_med_wall", {
--	description = "Torch",
	tiles = {
		{name="mytorches_torch_top3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch_top2.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:torch",
	light_source = 11,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.0625, -0.0625, 0.0625, 0.1875, 0.0625},
			{-0.0625, 0, 0, 0.0625, 0.125, 0.125},
			{-0.0625, -0.0625, 0.0625, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.125, 0.125, 0.0625, 0, 0.25},
			{-0.0625, -0.1875, 0.1875, 0.0625, -0.0625, 0.3125},
			{-0.0625, -0.25, 0.25, 0.0625, -0.125, 0.375},
			{-0.0625, -0.3125, 0.3125, 0.0625, -0.1875, 0.4375},
			{-0.0625, -0.375, 0.375, 0.0625, -0.25, 0.5},
		}
	},
	on_timer = function(pos, elapsed)
	local node = minetest.get_node(pos)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_dim_wall", param2 = node.param2})
	timer:start(torch_timer)
	end,

})
minetest.register_node("mytorches:torch_med_ceiling", {
--	description = "Torch",
	tiles = {
		"mytorches_torch_bottom.png",
		{name="mytorches_torch_top.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch3.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:torch",
	walkable = false,
	light_source = 11,
	groups = {dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.25, -0.03, 0.0625, 0.5, 0.03},
			{-0.03, -0.25, -0.0625, 0.03, 0.5, 0.0625},
			
		}
	},
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_dim_ceiling"})
	timer:start(torch_timer)
	end,
})
----------------------------------------------------------------------
minetest.register_node("mytorches:torch_dim", {
	description = "Torch",
	inventory_image = "",
	wield_image = "",
	tiles = {
		{name="mytorches_torch_top.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		"mytorches_torch_bottom.png",
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:stick",
	light_source = 8,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.03, 0.0625, 0, 0.03},
			{-0.03, -0.5, -0.0625, 0.03, 0, 0.0625},
		}
	},
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_out"})
	timer:start(torch_timer)
	end,
})
minetest.register_node("mytorches:torch_dim_wall", {
--	description = "Torch",
	tiles = {
		{name="mytorches_torch_top4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch_top3.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "default:stick",
	light_source = 8,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.125, 0.125, 0.0625, 0, 0.25},
			{-0.0625, -0.1875, 0.1875, 0.0625, -0.0625, 0.3125},
			{-0.0625, -0.25, 0.25, 0.0625, -0.125, 0.375},
			{-0.0625, -0.3125, 0.3125, 0.0625, -0.1875, 0.4375},
			{-0.0625, -0.375, 0.375, 0.0625, -0.25, 0.5},
		}
	},
	on_timer = function(pos, elapsed)
	local node = minetest.get_node(pos)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_out_wall", param2 = node.param2})
	timer:start(torch_timer)
	end,
})
minetest.register_node("mytorches:torch_dim_ceiling", {
--	description = "Torch",
	tiles = {
		"mytorches_torch_bottom.png",
		{name="mytorches_torch3.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
		{name="mytorches_torch4.png^[transformR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.5}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:stick",
	walkable = false,
	light_source = 8,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0, -0.03, 0.0625, 0.5, 0.03},
			{-0.03, 0, -0.0625, 0.03, 0.5, 0.0625},
		}
	},
	on_timer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	minetest.set_node(pos, {name = "mytorches:torch_out_ceiling"})
	timer:start(10)
	end,
})
----------------------------------------------------------------------
----------------------------------------------------------------------
minetest.register_node("mytorches:torch_out", {
	description = "Torch",
	inventory_image = "",
	wield_image = "",
	tiles = {
		"mytorches_torch_out.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "",
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.03, 0.0625, -0.25, 0.03},
			{-0.03, -0.5, -0.0625, 0.03, -0.25, 0.0625},
		}
	},
	on_timer = function(pos, elapsed)
	minetest.set_node(pos, {name = "air"})
	end,
})
minetest.register_node("mytorches:torch_out_wall", {
--	description = "Torch",
	tiles = {
		"mytorches_torch_out.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drop = "",
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.3125, 0.3125, 0.0625, -0.1875, 0.4375},
			{-0.0625, -0.375, 0.375, 0.0625, -0.25, 0.5},
		}
	},
	on_timer = function(pos, elapsed)
	minetest.set_node(pos, {name = "air"})
	end,

})
minetest.register_node("mytorches:torch_out_ceiling", {
--	description = "Torch",
	tiles = {
		"mytorches_torch_out.png^[transformR180",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "",
	walkable = false,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.25, -0.03, 0.0625, 0.5, 0.03},
			{-0.03, 0.25, -0.0625, 0.03, 0.5, 0.0625},
		}
	},
	on_timer = function(pos, elapsed)
	minetest.set_node(pos, {name = "air"})
	end,
})


minetest.register_abm({
	nodenames = {"default:torch","mytorches:torch_med","mytorches:torch_dim","mytorches:torch_out"},
	interval = 0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
			local p = {x = pos.x,y=pos.y-1,z=pos.z}
			local n = minetest.get_node(p).name
			local nd = node.name
			if n == "air" then
				if nd == "default:torch" then
					minetest.spawn_item(pos, "default:torch")
					minetest.remove_node(pos)
				elseif nd == "mytorches:torch_med" then
					minetest.spawn_item(pos, "default:stick")
					minetest.remove_node(pos)
				elseif nd == "mytorches:torch_dim" then
					minetest.spawn_item(pos, "default:stick")
					minetest.remove_node(pos)
				elseif nd == "mytorches:torch_out" then
					minetest.remove_node(pos)
				end
			
			end
		end
})



