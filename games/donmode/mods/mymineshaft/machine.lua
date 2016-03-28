local material = nil
local shape = nil
local make_ok = false
local anzahl = 0
local mat_tab = {
{"default:sandstone","default_sandstone"},
{"default:clay","default_clay"},
{"default:desert_stone","default_desert_stone"},
{"default:cobble","default_cobble"},
{"default:stone","default_stone"},
{"default:wood","default_wood"},
{"default:dirt","default_dirt"},
{"default:desert_cobble","default_desert_cobble"},
{"default:jungletree","default_jungletree"},
{"default:junglewood","default_junglewood"},
{"default:mossycobble","default_mossycobble"},
{"default:tree","default_tree"},
}

minetest.register_node("mymineshaft:machine_top", {
--	description = "Mine Shaft Machine",
	tiles = {
		"mymineshaft_machine_top_top.png",
		"mymineshaft_machine_top_bottom.png^[transformR180",
		"mymineshaft_machine_top_right.png",
		"mymineshaft_machine_top_left.png",
		"mymineshaft_machine_top_back.png",
		"mymineshaft_machine_top_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mymineshaft:machine",
	sunlight_propogates = true,
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.0625}, 
			{-0.125, -0.4375, -0.0625, 0.125, -0.375, 0.0625}, 
			{-0.1875, -0.375, -0.0625, 0.1875, -0.3125, 0.0625}, 
			{-0.25, -0.3125, -0.0625, 0.25, -0.0625, 0.0625}, 
			{-0.0625, -0.4375, -0.125, 0.0625, -0.375, 0.125}, 
			{-0.0625, -0.375, -0.1875, 0.0625, -0.3125, 0.1875},
			{-0.0625, -0.3125, -0.25, 0.0625, -0.0625, 0.25}, 
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.125, 0.0625}, 
			{-0.125, 0.125, -0.125, 0.125, 0.4375, 0.125},
			{-0.5, -0.5, 0.375, -0.3125, 0.5, 0.5}, 
			{0.3125, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.375, 0.125, -0.375, 0.5, 0.375}, 
			{0.375, 0.375, 0.125, 0.5, 0.5, 0.375}, 
			{-0.375, 0.375, 0.125, 0.375, 0.5, 0.1875}, 
			{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.125}, 
		}
	},
	after_destruct = function(pos, oldnode)
		minetest.remove_node({x = pos.x, y = pos.y - 1, z = pos.z})
	end,
})

minetest.register_node("mymineshaft:machine", {
	description = "Mine Shaft Machine",
	tiles = {
		"mymineshaft_machine_bottom_top.png",
		"mymineshaft_machine_bottom_bottom.png",
		"mymineshaft_machine_bottom_right.png",
		"mymineshaft_machine_bottom_left.png",
		"mymineshaft_machine_bottom_front.png",
		"mymineshaft_machine_bottom_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "mymineshaft_mach_inv.png",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, 
			{-0.1875, -0.375, -0.4375, 0.1875, 0, 0.4375}, 
			{-0.25, -0.375, -0.375, 0.25, 0, 0.375},
			{-0.3125, -0.375, -0.3125, 0.3125, 0, 0.3125}, 
			{-0.375, -0.375, -0.25, 0.375, 0, 0.25},
			{-0.4375, -0.375, -0.1875, 0.4375, 0, 0.1875}, 
			{-0.5, -0.375, 0.375, -0.3125, 0.5, 0.5}, 
			{0.3125, -0.375, 0.375, 0.5, 0.5, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.5, 0.5},
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

	after_destruct = function(pos, oldnode)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
	end,

	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:machine_top", param2=minetest.dir_to_facedir(placer:get_look_dir())});

	local meta = minetest.get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mine Shaft Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end,
can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if inv:is_empty("ingot") and
	   inv:is_empty("res") then
		return true
	else
	return false
	end
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[8,9;]"..
		"background[-0.15,-0.25;8.40,9.75;mymineshaft_background.png]"..
		"list[current_name;ingot;5.5,1;1,1;]"..
		"list[current_name;res;5.5,3;1,1;]"..
		"label[5.5,0.5;Input:]"..
		"label[5.5,2.5;Output:]"..
--		Column 1
		"label[1,0.5;Shaft]"..
		"item_image_button[1,1;1,1;mymineshaft:shaft_default_clay;shaft; ]"..
		"label[1,2;Middle]"..
		"item_image_button[1,2.5;1,1;mymineshaft:shaft_middle_default_clay;middle; ]"..
		"item_image_button[3.5,1;1,1;mymineshaft:shaft_newtop_default_clay;newshaft; ]"..
--		Column 2
		"label[2.5,0.5;Top]"..
		"item_image_button[2.5,1;1,1;mymineshaft:shaft_top_closed_default_clay;top2; ]"..
		"label[2.5,2;Bottom]"..
		"item_image_button[2.5,2.5;1,1;mymineshaft:shaft_bottom_default_clay;bottom; ]"..
		"item_image_button[3.5,2.5;1,1;mymineshaft:shaft_newtop_default_clay;newtop; ]"..
		"list[current_player;main;0,5;8,4;]")
	meta:set_string("infotext", "Brick Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

if fields["shaft"] 
or fields["top2"] 
or fields["bottom"]
or fields["middle"]
or fields["newtop"]
or fields["newshaft"]
then

	if fields["shaft"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["top2"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_top_closed_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["bottom"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_bottom_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["middle"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_middle_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["newtop"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_newtop_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["newshaft"] then
		make_ok = false
		anzahl = 1
		shape = "mymineshaft:shaft_bigshaft_"
		if inv:is_empty("ingot") then
			return
		end
	end



		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------

for i in ipairs (mat_tab) do
local this = mat_tab[i][1]
local that = mat_tab[i][2]

		if ingotstack:get_name()==this then
				material = that
				make_ok = true
		end

----------------------------------------------------------------------
		if make_ok == true then
			inv:add_item("res",shape..material)
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end
end

})

--Craft

minetest.register_craft({
		output = 'mymineshaft:machine',
		recipe = {
			{'default:sand', 'default:brick', 'default:sand'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:sand', "default:brick", 'default:sand'},		
		},
})













