 local dyet = {}
 local dyem = {}
 local dirtt = {}
 local mulcht = {}

 local make_mulch = {}
 local make_dye = {}
 local make_dirt = {}

 local outputmulch = {}
 local outputdye = {}
 local outputdirt = {}

minetest.register_node("mymulch:machine", {
	description = "Compost Machine",
	tiles = {
		"mymulch_machine_top.png",
		"mymulch_machine_bottom.png",
		"mymulch_machine_right.png",
		"mymulch_machine_left.png",
		"mymulch_machine_bottom.png",
		"mymulch_machine_front.png"
},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=2, cracky=3, dig_immediate=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.375, -0.4375, 0.4375, 0.4375}, 
			{-0.5, -0.5, 0.3125, -0.4375, 0.375, 0.375},
			{-0.5, -0.5, 0.25, -0.4375, 0.3125, 0.3125}, 
			{-0.5, -0.5, 0.1875, -0.4375, 0.25, 0.25},
			{-0.5, -0.5, 0.125, -0.4375, 0.1875, 0.1875},
			{-0.5, -0.5, 0.0625, -0.4375, 0.125, 0.125}, 
			{-0.5, -0.5, 0, -0.4375, 0.0625, 0.0625}, 
			{-0.5, -0.5, -0.0625, -0.4375, 0, 0}, 
			{-0.5, -0.5, -0.125, -0.4375, -0.0625, -0.0625},
			{-0.5, -0.5, -0.1875, -0.4375, -0.125, -0.125}, 
			{-0.5, -0.5, -0.25, -0.4375, -0.1875, -0.1875}, 
			{-0.5, -0.5, -0.3125, -0.4375, -0.25, -0.25}, 
			{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.3125}, 
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.4375}, 
			{0.4375, -0.5, 0.375, 0.5, 0.4375, 0.4375}, 
			{0.4375, -0.5, 0.3125, 0.5, 0.375, 0.375}, 
			{0.4375, -0.5, 0.25, 0.5, 0.3125, 0.3125}, 
			{0.4375, -0.5, 0.1875, 0.5, 0.25, 0.25}, 
			{0.4375, -0.5, 0.125, 0.5, 0.1875, 0.1875}, 
			{0.4375, -0.5, 0.0625, 0.5, 0.125, 0.125},
			{0.4375, -0.5, 0, 0.5, 0.0625, 0.0625}, 
			{0.4375, -0.5, -0.0625, 0.5, 0, 0},
			{0.4375, -0.5, -0.125, 0.5, -0.0625, -0.0625}, 
			{0.4375, -0.5, -0.1875, 0.5, -0.125, -0.125}, 
			{0.4375, -0.5, -0.25, 0.5, -0.1875, -0.1875}, 
			{0.4375, -0.5, -0.3125, 0.5, -0.25, -0.25}, 
			{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.3125}, 
			{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375}, 
			{-0.5, -0.3125, -0.125, 0.5, -0.125, 0.5}, 
			{-0.4375, -0.5, 0.125, 0.4375, 0.0625, 0.4375}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.375, -0.4375, 0.4375, 0.4375}, 
			{-0.5, -0.5, 0.3125, -0.4375, 0.375, 0.375},
			{-0.5, -0.5, 0.25, -0.4375, 0.3125, 0.3125}, 
			{-0.5, -0.5, 0.1875, -0.4375, 0.25, 0.25},
			{-0.5, -0.5, 0.125, -0.4375, 0.1875, 0.1875},
			{-0.5, -0.5, 0.0625, -0.4375, 0.125, 0.125}, 
			{-0.5, -0.5, 0, -0.4375, 0.0625, 0.0625}, 
			{-0.5, -0.5, -0.0625, -0.4375, 0, 0}, 
			{-0.5, -0.5, -0.125, -0.4375, -0.0625, -0.0625},
			{-0.5, -0.5, -0.1875, -0.4375, -0.125, -0.125}, 
			{-0.5, -0.5, -0.25, -0.4375, -0.1875, -0.1875}, 
			{-0.5, -0.5, -0.3125, -0.4375, -0.25, -0.25}, 
			{-0.5, -0.5, -0.5, -0.4375, -0.3125, -0.3125}, 
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.4375}, 
			{0.4375, -0.5, 0.375, 0.5, 0.4375, 0.4375}, 
			{0.4375, -0.5, 0.3125, 0.5, 0.375, 0.375}, 
			{0.4375, -0.5, 0.25, 0.5, 0.3125, 0.3125}, 
			{0.4375, -0.5, 0.1875, 0.5, 0.25, 0.25}, 
			{0.4375, -0.5, 0.125, 0.5, 0.1875, 0.1875}, 
			{0.4375, -0.5, 0.0625, 0.5, 0.125, 0.125},
			{0.4375, -0.5, 0, 0.5, 0.0625, 0.0625}, 
			{0.4375, -0.5, -0.0625, 0.5, 0, 0},
			{0.4375, -0.5, -0.125, 0.5, -0.0625, -0.0625}, 
			{0.4375, -0.5, -0.1875, 0.5, -0.125, -0.125}, 
			{0.4375, -0.5, -0.25, 0.5, -0.1875, -0.1875}, 
			{0.4375, -0.5, -0.3125, 0.5, -0.25, -0.25}, 
			{0.4375, -0.5, -0.5, 0.5, -0.3125, -0.3125}, 
			{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375}, 
			{-0.5, -0.3125, -0.125, 0.5, -0.125, 0.5}, 
			{-0.4375, -0.5, 0.125, 0.4375, 0.0625, 0.4375}, 
		}
	},

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local timer = minetest.get_node_timer(pos)
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Composter (owned by " .. (placer:get_player_name() or "") .. ")");
		timer:start(10)
		end,

can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("craft1") then
		return false
	elseif not inv:is_empty("craft2") then
		return false
	elseif not inv:is_empty("craft3") then
		return false
	elseif not inv:is_empty("craft4") then
		return false
	elseif not inv:is_empty("res") then
		return false
	elseif not inv:is_empty("mulch") then
		return false
	elseif not inv:is_empty("dye") then
		return false
	elseif not inv:is_empty("res2") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "invsize[10.5,10;]"..
		"background[-0.15,-0.25;10.90,10.75;mymulch_background.png]"..

		"label[1.5,0.5;  Craft Mulch]"..
		"list[current_name;craft1;1.5,1;1,1; ]"..
		"list[current_name;craft2;1.5,2;1,1; ]"..
		"list[current_name;craft3;2.5,1;1,1; ]"..
		"list[current_name;craft4;2.5,2;1,1; ]"..
		"button[4,1;1,1;make;Make]"..
		"list[current_name;res;4,2;1,1;]"..

		"label[5,2; +]"..
		"label[5.5,1.5;  Dye]"..
		"list[current_name;dye;5.5,2;1,1;]"..
		"button[5.5,3;1,1;color;Color]"..

		"label[5.5,4;Output]"..
		"list[current_name;res2;5.5,4.5;1,1;]"..


		"label[0.5,5.5;2 Mulch = 1 Dirt]"..
		"list[current_name;dirt1;0.5,4.5;1,1;]"..
		"list[current_name;dirt2;1.5,4.5;1,1;]"..
		"button[2.5,4.5;1,1;makedirt;Make]"..
		"list[current_name;res3;3.5,4.5;1,1;]"..

		--Decomposer
		"label[7.5,0.5.5;Decomposer]"..
		"label[7.5,1;Insert mulch and over]"..
		"label[7.5,1.5;time it will become clay]"..
		"label[8,2.5.5;Mulch]"..
		"list[current_name;decom;8,3;1,1;]"..
		"label[8,4;Clay]"..
		"list[current_name;clay;8,4.5;1,1;]"..
		


		"label[0.5,3;Add any leaves, sticks, flowers]"..
		"label[1,3.5;or plants to make mulch]"..

		"list[current_player;main;1,6;8,4;]")
	meta:set_string("infotext", "Composter")
	local inv = meta:get_inventory()
	inv:set_size("craft1", 1)
	inv:set_size("craft2", 1)
	inv:set_size("craft3", 1)
	inv:set_size("craft4", 1)
	inv:set_size("dirt1", 1)
	inv:set_size("dirt2", 1)
	inv:set_size("dye", 1)
	inv:set_size("res", 1)
	inv:set_size("res2", 1)
	inv:set_size("res3", 1)
	inv:set_size("decom", 1)
	inv:set_size("clay", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

if fields["make"]
then 

	if fields["make"] then
		make_mulch = "0"
		outputmulch = "1"
		mulcht = "mymulch:mulch_tan"
		if inv:is_empty("craft1") or
		   inv:is_empty("craft2") or
		   inv:is_empty("craft3") or
		   inv:is_empty("craft4") then
			return
		end
	end
	
		local ingotstack1 = inv:get_stack("craft1", 1)
		local ingotstack2 = inv:get_stack("craft2", 1)
		local ingotstack3 = inv:get_stack("craft3", 1)
		local ingotstack4 = inv:get_stack("craft4", 1)
		local resstack = inv:get_stack("res", 1)


local leaves1 = minetest.registered_aliases[ingotstack1:get_name()]
if not leaves1 then
    leaves1 = ingotstack1:get_name()
end
local leaves2 = minetest.registered_aliases[ingotstack2:get_name()]
if not leaves2 then
    leaves2 = ingotstack2:get_name()
end
local leaves3 = minetest.registered_aliases[ingotstack3:get_name()]
if not leaves3 then
    leaves3 = ingotstack3:get_name()
end
local leaves4 = minetest.registered_aliases[ingotstack4:get_name()]
if not leaves4 then
    leaves4 = ingotstack4:get_name()
end
----------------------------------------------------------------------
local flora1 = minetest.registered_aliases[ingotstack1:get_name()]
if not flora1 then
    flora1 = ingotstack1:get_name()
end
local flora2 = minetest.registered_aliases[ingotstack2:get_name()]
if not flora2 then
    flora2 = ingotstack2:get_name()
end
local flora3 = minetest.registered_aliases[ingotstack3:get_name()]
if not flora3 then
    flora3 = ingotstack3:get_name()
end
local flora4 = minetest.registered_aliases[ingotstack4:get_name()]
if not flora4 then
    flora4 = ingotstack4:get_name()
end
----------------------------------------------------------------------
local stick1 = minetest.registered_aliases[ingotstack1:get_name()]
if not stick1 then
    stick1 = ingotstack1:get_name()
end
local stick2 = minetest.registered_aliases[ingotstack2:get_name()]
if not stick2 then
    stick2 = ingotstack2:get_name()
end
local stick3 = minetest.registered_aliases[ingotstack3:get_name()]
if not stick3 then
    stick3 = ingotstack3:get_name()
end
local stick4 = minetest.registered_aliases[ingotstack4:get_name()]
if not stick4 then
    stick4 = ingotstack4:get_name()
end

-- Check group
local iteml1 = minetest.registered_items[leaves1]
local iteml2 = minetest.registered_items[leaves2]
local iteml3 = minetest.registered_items[leaves3]
local iteml4 = minetest.registered_items[leaves4]
local itemf1 = minetest.registered_items[flora1]
local itemf2 = minetest.registered_items[flora2]
local itemf3 = minetest.registered_items[flora3]
local itemf4 = minetest.registered_items[flora4]
local items1 = minetest.registered_items[stick1]
local items2 = minetest.registered_items[stick2]
local items3 = minetest.registered_items[stick3]
local items4 = minetest.registered_items[stick4]

local slot1 = {}
local slot2 = {}
local slot3 = {}
local slot4 = {}

if items1 and items1.groups and items1.groups["stick"] or
   itemf1 and itemf1.groups and itemf1.groups["flora"] or
   iteml1 and iteml1.groups and iteml1.groups["leaves"] or
   ingotstack1:get_name() == "default:dry_shrub" then
	slot1 = 1
end
if items2 and items2.groups and items2.groups["stick"] or
   itemf2 and itemf2.groups and itemf2.groups["flora"] or
   iteml2 and iteml2.groups and iteml2.groups["leaves"] or
   ingotstack2:get_name() == "default:dry_shrub" then
	slot2 = 1
end
if items3 and items3.groups and items3.groups["stick"] or
   itemf3 and itemf3.groups and itemf3.groups["flora"] or
   iteml3 and iteml3.groups and iteml3.groups["leaves"] or
   ingotstack3:get_name() == "default:dry_shrub" then
	slot3 = 1
end
if items4 and items4.groups and items4.groups["stick"] or
   itemf4 and itemf4.groups and itemf4.groups["flora"] or
   iteml4 and iteml4.groups and iteml4.groups["leaves"] or
   ingotstack4:get_name() == "default:dry_shrub" then
	slot4 = 1
end
if slot1 == 1 and slot2 == 1 and slot3 == 1 and slot4 == 1 then
				make_mulch = "1"
end

----------------------------------------------------------------------
----------------------------------------------------------------------
  
		if make_mulch == "1" then
			local give = {}
			for i = 0, outputmulch-1 do
				give[i+1]=inv:add_item("res",mulcht)
			end
			ingotstack1:take_item()
			inv:set_stack("craft1",1,ingotstack1)
			ingotstack2:take_item()
			inv:set_stack("craft2",1,ingotstack2)
			ingotstack3:take_item()
			inv:set_stack("craft3",1,ingotstack3)
			ingotstack4:take_item()
			inv:set_stack("craft4",1,ingotstack4)
		end

end

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
local mulch_tab = {
{"black", "Black", "mymulch_black.png"},
{"blue", "Blue", "mymulch_blue.png"},
{"brown", "Brown", "mymulch_brown.png"},
{"cyan", "Cyan", "mymulch_cyan.png"},
{"dark_green", "Dark Green", "mymulch_dark_green.png"},
{"dark_grey", "Dark Grey", "mymulch_dark_grey.png"},
{"green", "Green", "mymulch_green.png"},
{"grey", "Grey", "mymulch_grey.png"},
{"magenta", "Magenta", "mymulch_magenta.png"},
{"orange", "Orange", "mymulch_orange.png"},
{"pink", "Pink", "mymulch_pink.png"},
{"red", "Red", "mymulch_red.png"},
{"violet", "Violet", "mymulch_violet.png"},
{"white", "White", "mymulch_white.png"},
{"yellow", "Yellow", "mymulch_yellow.png"},
{"tan", "Tan", "mymulch_tan.png"},
}
for i in ipairs (mulch_tab) do
	local mat = mulch_tab[i][1]
	local desc = mulch_tab[i][2]
	local image = mulch_tab[i][3]


if fields["color"]
then 

	if fields["color"] then
		make_dye = "0"
		outputdye = "1"
		dyet = "mymulch:mulch_"
		if inv:is_empty("res") or
		inv:is_empty("dye") then
			return
		end
	end




		local dyestack = inv:get_stack("dye", 1)
		local resstack = inv:get_stack("res", 1)
		local resstack2 = inv:get_stack("res2", 1)


----------------------------------------------------------------------
		if resstack:get_name()=="mymulch:mulch_tan" and
		   dyestack:get_name()=="dye:"..mat then
				dyem = mat
				make_dye = "1"
		end

----------------------------------------------------------------------
		if make_dye == "1" then
			local giveme = {}
			for i = 0, outputdye-1 do
				giveme[i+1]=inv:add_item("res2",dyet..dyem)
			end
			resstack:take_item()
			inv:set_stack("res",1,resstack)
			dyestack:take_item()
			inv:set_stack("dye",1,dyestack)
		end


end


if fields["makedirt"]
then 

	if fields["makedirt"] then
		make_dirt = "0"
		outputdirt = "1"
		dirt = "default:dirt"
		if inv:is_empty("dirt1") or
		   inv:is_empty("dirt2") then
			return
		end
	end



		local dirtstack1 = inv:get_stack("dirt1", 1)
		local dirtstack2 = inv:get_stack("dirt2", 1)
		local resstack = inv:get_stack("res3", 1)

		if dirtstack1:get_name()=="mymulch:mulch_"..mat and
		   dirtstack2:get_name()=="mymulch:mulch_"..mat then
				make_dirt = "1"
		end

		if make_dirt == "1" then
			local giveme = {}
			for j = 0, outputdirt-1 do
				giveme[j+1]=inv:add_item("res3",dirt)
			end
			dirtstack1:take_item()
			inv:set_stack("dirt1",1,dirtstack1)
			dirtstack2:take_item()
			inv:set_stack("dirt2",1,dirtstack2)
		end
end
end

end,

	on_timer = function(pos)
local mulch_tab = {
{"black", "Black", "mymulch_black.png"},
{"blue", "Blue", "mymulch_blue.png"},
{"brown", "Brown", "mymulch_brown.png"},
{"cyan", "Cyan", "mymulch_cyan.png"},
{"dark_green", "Dark Green", "mymulch_dark_green.png"},
{"dark_grey", "Dark Grey", "mymulch_dark_grey.png"},
{"green", "Green", "mymulch_green.png"},
{"grey", "Grey", "mymulch_grey.png"},
{"magenta", "Magenta", "mymulch_magenta.png"},
{"orange", "Orange", "mymulch_orange.png"},
{"pink", "Pink", "mymulch_pink.png"},
{"red", "Red", "mymulch_red.png"},
{"violet", "Violet", "mymulch_violet.png"},
{"white", "White", "mymulch_white.png"},
{"yellow", "Yellow", "mymulch_yellow.png"},
{"tan", "Tan", "mymulch_tan.png"},
}
for i in ipairs (mulch_tab) do
	local mat = mulch_tab[i][1]
	local desc = mulch_tab[i][2]
	local image = mulch_tab[i][3]

		local timer = minetest.get_node_timer(pos)
		local timeout = timer:get_timeout()
		local meta = minetest.get_meta(pos)
		local inven = meta:get_inventory()
		local decomp = inven:get_stack("decom",1)
		local clay = inven:get_stack("clay",1)
		local deco = decomp:get_name()

		if deco == "mymulch:mulch_"..mat then
			inven:add_item("clay", "default:clay_lump")
			decomp:take_item()
			inven:set_stack("decom",1,decomp)
		end
		timer:start(10)
end
	end,

})



--Craft

minetest.register_craft({
		output = 'mymulch:machine',
		recipe = {
			{'group:leaves', 'group:wood', 'group:leaves'},
			{'group:wood', 'default:apple', 'group:wood'},
			{'group:leaves', "group:wood", 'group:leaves'},		
		},
})











