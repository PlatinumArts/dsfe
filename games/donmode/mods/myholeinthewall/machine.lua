local material = {}
local shape = {}
local make_ok = {}
local anzahl = {}
function minetest.get_mydrillpress_formspec(pos)
    local spos = pos.x .. "," .. pos.y .. "," ..pos.z
    local formspec =
        "size[9,6]"..
        "list[nodemeta:".. spos .. ";main;1.5,0.5;6,1;]"..
        "list[current_player;main;0.5,2;8,4;]"
    return formspec
end

local function has_mydrillpress_privilege(meta, player)
    if player:get_player_name() ~= meta:get_string("owner") then
        return false
    end
    return true
end
minetest.register_node("myholeinthewall:machine", {
	description = "Hole Machine",
	inventory_image = "myholeinthewall_inventory_image.png",
	tiles = {
		"myholeinthewall_machine_top.png",
		"myholeinthewall_machine_bottom.png",
		"myholeinthewall_machine_side.png",
		"myholeinthewall_machine_side.png",
		"myholeinthewall_machine_side.png",
		"myholeinthewall_machine_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.375}, 
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, 
			{0.1875, -0.5, -0.375, 0.375, -0.375, -0.1875}, 
			{0.1875, -0.5, 0.1875, 0.375, -0.375, 0.375}, 
			{-0.375, -0.5, -0.375, -0.1875, -0.375, -0.1875},
			{-0.375, -0.5, 0.1875, -0.1875, -0.375, 0.375}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
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
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end,

	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "myholeinthewall:machine_top", param2=minetest.dir_to_facedir(placer:get_look_dir())});
	

        local meta = minetest.get_meta(pos)
        meta:set_string("owner", placer:get_player_name() or "")
        meta:set_string("infotext", "Drill Press (owned by "..
                meta:get_string("owner")..")")
    end,
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Drill Press")
        meta:set_string("owner", "")
        local inv = meta:get_inventory()
        inv:set_size("main", 9*6)
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

        return inv:is_empty("main") and has_mydrillpress_privilege(meta, player)
	


    end,
    allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        local meta = minetest.get_meta(pos)
        if not has_mydrillpress_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a drill press belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return count
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        if not has_mydrillpress_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a drill press belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return stack:get_count()
    end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        if not has_mydrillpress_privilege(meta, player) then
            minetest.log("action", player:get_player_name()..
                    " tried to access a drill press belonging to "..
                    meta:get_string("owner").." at "..
                    minetest.pos_to_string(pos))
            return 0
        end
        return stack:get_count()
    end,
    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        minetest.log("action", player:get_player_name()..
                " moves stuff into drill press at "..minetest.pos_to_string(pos))
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name()..
                " moves stuff into drill press at "..minetest.pos_to_string(pos))
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name()..
                " takes stuff from drill press at "..minetest.pos_to_string(pos))
    end,
    on_rightclick = function(pos, node, clicker)
        local meta = minetest.get_meta(pos)
        if has_mydrillpress_privilege(meta, clicker) then
            minetest.show_formspec(
                clicker:get_player_name(),
                "myholeinthewall:machine",
                minetest.get_mydrillpress_formspec(pos)
            )
        end
    end,







})


minetest.register_node("myholeinthewall:machine_top", {
	description = "Hole Machine",
	tiles = {
		"myholeinthewall_machinetop_top.png",
		"myholeinthewall_machinetop_bottom.png^[transformR180",
		"myholeinthewall_machinetop_rside.png",
		"myholeinthewall_machinetop_lside.png",
		"myholeinthewall_machinetop_back.png",
		"myholeinthewall_machinetop_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "myholeinthewall:machine",
	groups = {cracky=2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.0625, -0.125, 0.1875, 0.5, 0.3125}, 
			{-0.1875, 0.125, -0.1875, 0.1875, 0.4375, 0.375}, 
			{-0.1875, -0.5, 0.375, -0.0625, 0.3125, 0.5}, 
			{0.0625, -0.5, 0.375, 0.1875, 0.3125, 0.5}, 
			{-0.0625, -0.25, -0.0625, 0, 0.5, 0}, 
			{-0.1875, 0.3125, 0.375, 0.1875, 0.375, 0.4375}, 
			{0.1875, 0.1875, -0.0625, 0.25, 0.375, 0.125}, 
			{0.1875, 0.25, -0.5, 0.25, 0.3125, 0}, 
		}
	},

	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end,


can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
    
        local meta = minetest.get_meta({x=pos.x,y=pos.y-1,z=pos.z});
        local inv = meta:get_inventory()
        return inv:is_empty("main") and has_mydrillpress_privilege(meta, player)
    
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "invsize[8,9;]"..
		"background[-0.15,-0.25;8.40,9.75;myholeinthewall_background.png]"..
		"list[current_name;ingot;5.5,1;1,1;]"..
		"list[current_name;res;5.5,3;1,1;]"..
		"label[5.5,0.5;Input:]"..
		"label[5.5,2.5;Output:]"..
		"label[0,0;Choose Hole:]"..
--		Column 1
		"image_button[0.5,1;1,1;myholeinthewall_mach1.png;diamond; ]"..
		"image_button[0.5,2;1,1;myholeinthewall_mach2.png;diamondr; ]"..
		"image_button[0.5,3;1,1;myholeinthewall_mach3.png;x; ]"..
--		Column 2
		"image_button[1.5,1;1,1;myholeinthewall_mach7.png;diamondh; ]"..
		"image_button[1.5,2;1,1;myholeinthewall_mach8.png;diamondrh; ]"..
		"image_button[1.5,3;1,1;myholeinthewall_mach9.png;xh; ]"..
--      Column 3
		"image_button[2.5,1;1,1;myholeinthewall_mach4.png;cross; ]"..
		"image_button[2.5,2;1,1;myholeinthewall_mach5.png;crossi; ]"..
		"image_button[2.5,3;1,1;myholeinthewall_mach6.png;o; ]"..
--		Column 4
		"image_button[3.5,1;1,1;myholeinthewall_mach10.png;crossh; ]"..
		"image_button[3.5,2;1,1;myholeinthewall_mach11.png;crossih; ]"..
		"image_button[3.5,3;1,1;myholeinthewall_mach12.png;oh; ]"..
		"list[current_player;main;0,5;8,4;]")
	meta:set_string("infotext", "Drill Press")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

if fields["diamond"] 
or fields["diamondr"] 
or fields["x"] 
or fields["cross"]
or fields["crossi"]
or fields["o"]
or fields["diamondh"] 
or fields["diamondrh"] 
or fields["xh"] 
or fields["crossh"]
or fields["crossih"]
or fields["oh"]
then

	if fields["diamond"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:diamond_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["diamondr"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:diamond_rough_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["x"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:x_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["cross"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:cross_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["crossi"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:cross_iron_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["o"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:o_"
		if inv:is_empty("ingot") then
			return
		end
	end

----------------------------------------------------------
if fields["diamondh"] then
		make_ok = "0"
		anzahl = "2"
		shape = "myholeinthewall:diamond_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["diamondrh"] then
		make_ok = "0"
		anzahl = "2"
		shape = "myholeinthewall:diamond_rough_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["xh"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:x_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["crossh"] then
		make_ok = "0"
		anzahl = "2"
		shape = "myholeinthewall:cross_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["crossih"] then
		make_ok = "0"
		anzahl = "2"
		shape = "myholeinthewall:cross_iron_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["oh"] then
		make_ok = "0"
		anzahl = "2"
		shape = "myholeinthewall:o_half_"
		if inv:is_empty("ingot") then
			return
		end
	end

		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------
		if ingotstack:get_name()=="default:sandstone" then
				material = "default_sandstone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_sand" then
				material = "default_desert_sand"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:clay" then
				material = "default_clay"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_stone" then
				material = "default_desert_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cobble" then
				material = "default_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stone" then
				material = "default_stone"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:cactus" then
				material = "default_cactus"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:sand" then
				material = "default_sand"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:wood" then
				material = "default_wood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:pine_wood" then
				material = "default_pine_wood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:dirt" then
				material = "default_dirt"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:brick" then
				material = "default_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:bronzeblock" then
				material = "default_bronze_block"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:coalblock" then
				material = "default_coal_block"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:copperblock" then
				material = "default_copper_block"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:desert_cobble" then
				material = "default_desert_cobble"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:diamondblock" then
				material = "default_diamond_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:glass" then
				material = "default_glass"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:goldblock" then
				material = "default_gold_block"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:gravel" then
				material = "default_gravel"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:ice" then
				material = "default_ice"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:jungletree" then
				material = "default_jungletree"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:junglewood" then
				material = "default_junglewood"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:lava_source" then
				material = "default_lava"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:mese" then
				material = "default_mese"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="default:mossycobble" then
				material = "default_mossycobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:obsidian" then
				material = "default_obsidian"
				make_ok = "1"
		end
--[[
		if ingotstack:get_name()=="default:obsidian_glass" then
				material = "default_obsidian_glass"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:obsidianbrick" then
				material = "default_obsidian_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:pinetree" then
				material = "default_pinetree"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:sanddstonebrick" then
				material = "default_sandstone_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:snowblock" then
				material = "default_snow"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:steelblock" then
				material = "default_steel_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stonebrick" then
				material = "default_stone_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:tree" then
				material = "default_tree"
				make_ok = "1"
		end
]]
--[[
		if ingotstack:get_name()=="default:water_source" then
				material = "default_water"
				make_ok = "1"
		end
]]
		if ingotstack:get_name()=="farming:straw" then
				material = "farming_straw"
				make_ok = "1"
		end

----------------------------------------------------------------------------
--wool

		if ingotstack:get_name()=="wool:white" then
				material = "wool_white"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:black" then
				material = "wool_black"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:blue" then
				material = "wool_blue"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:brown" then
				material = "wool_brown"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:cyan" then
				material = "wool_cyan"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:dark_green" then
				material = "wool_dark_green"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:dark_grey" then
				material = "wool_dark_grey"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:green" then
				material = "wool_green"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:grey" then
				material = "wool_grey"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:magenta" then
				material = "wool_magenta"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:orange" then
				material = "wool_orange"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:pink" then
				material = "wool_pink"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:red" then
				material = "wool_red"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:violet" then
				material = "wool_violet"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:yellow" then
				material = "wool_yellow"
				make_ok = "1"
		end

----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end


})

--Craft

minetest.register_craft({
		output = 'myholeinthewall:machine',
		recipe = {
			{'default:coalblock', 'default:coalblock', 'default:coalblock'},
			{'default:coalblock', 'default:diamond', 'default:coalblock'},
			{'default:coalblock', "default:coalblock", 'default:coalblock'},		
		},
})













