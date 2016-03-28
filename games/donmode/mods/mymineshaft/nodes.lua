function mymineshaft.register_all(mat, desc, image, mygroups, craft, drawtype)

local cbox = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.46}, 
			{0.46, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.46, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.46, 0.5, 0.5}, 
		}	
	}

minetest.register_node("mymineshaft:shaft_"..mat,{
	description = desc.." Shaft",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaft.obj",
	paramtype = "light",
	light_source = 8,
	climbable = true,
	walkable = true,
	groups = {crumbly = 1,  cracky=1, not_in_creative_inventory=1},

	selection_box = cbox,
	collision_box = cbox,
})
minetest.register_node("mymineshaft:shaft_top_open_"..mat,{
	description = desc.."Open Shaft Top",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaft.obj",
	paramtype = "light",
	climbable = true,
	walkable = true,
	drop = "mymineshaft:shaft_top_closed_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = cbox,
	collision_box = cbox,
	on_punch = function(pos, node, clicker)
		minetest.set_node(pos,{name = "mymineshaft:shaft_top_closed_"..mat})
	end,
})
minetest.register_node("mymineshaft:shaft_top_closed_"..mat,{
	description = desc.." Closed Shaft Top",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaftc.obj",
	paramtype = "light",
	climbable = true,
	walkable = true,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	sounds = {footstep={name = "mymineshaft_step"}},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}	
	},

	on_punch = function(pos, node, clicker)
		minetest.set_node(pos,{name = "mymineshaft:shaft_top_open_"..mat})
	end,
})

minetest.register_node("mymineshaft:shaft_bottom_"..mat,{
	description = desc.." Shaft Bottom",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_bottom.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = false,
	walkable = true,
	groups = {crumbly = 1,  cracky=1, fall_damage_add_percent = -1000, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, 
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, 

			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
		}	
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, 
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
		}
	},

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            minetest.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return minetest.item_place(itemstack, placer, pointed_thing)
    end,

	after_place_node = function(pos)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:shaft_bottom2_"..mat})
	end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end
})

minetest.register_node("mymineshaft:shaft_bottom2_"..mat,{
	description = desc.." Shaft Bottom 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},

	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.5, 0.375, -0.375, 0.5, 0.5}, 
			{0.375, 0.5, 0.375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.5, -0.5, -0.375, 0.5, -0.375}, 
			{0.375, 0.5, -0.5, 0.5, 0.5, -0.375}, 
		}	
	},

	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})

minetest.register_node("mymineshaft:shaft_middle_"..mat,{
	description = desc.." Shaft Middle",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	groups = {crumbly = 1,  cracky=1, fall_damage_add_percent = -1000, not_in_creative_inventory=1},

	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
		}	
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375},  
		}	
	},

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            minetest.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return minetest.item_place(itemstack, placer, pointed_thing)
    end,

	after_place_node = function(pos)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:shaft_middle2_"..mat})
	end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end

})

minetest.register_node("mymineshaft:shaft_middle2_"..mat,{
	description = desc.." Shaft Middle 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.5, 0.375, -0.375, 0.5, 0.5}, 
			{0.375, 0.5, 0.375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.5, -0.5, -0.375, 0.5, -0.375}, 
			{0.375, 0.5, -0.5, 0.5, 0.5, -0.375},  
		}	
	},

	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})

minetest.register_node("mymineshaft:shaft_newtop_"..mat,{
	description = desc.." Shaft Middle 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "twobytop.obj",
	visual_scale = 0.2,
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 3.5, 5.5, 3.5},  
		}	
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 3.5, 5.5, 3.5},  
		}	
	},
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})
minetest.register_node("mymineshaft:shaft_bigshaft_"..mat,{
	description = desc.." Shaft Middle 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "twobymineshaft.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},  
		}	
	},

	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})
end





		
