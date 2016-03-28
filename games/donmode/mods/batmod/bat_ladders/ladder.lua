-- Bat Mod by Batman --
--===========================================

--
-- register nodes:
--

--BatLadder

minetest.register_node("bat_ladders:bat_ladder", {
	description = "Bat_Ladder",
	drawtype = "signlike",
	tiles = {"bat_ladder.png"},
	inventory_image = "bat_ladder.png",
	wield_image = "bat_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

--3d Bat Ladder

minetest.register_node("bat_ladders:bat_3dladder", {
        description = "Bat 3d Ladder",
        drawtype = "nodebox",
        tiles = {"bat_ladder_top.png",
                "bat_ladder_bottom.png",
                "bat_ladder_right.png",
                "bat_ladder_left.png",
                "bat_ladder_back.png",
                "bat_ladder_front.png"},
        inventory_image = "bat_ladder_front.png",
        wield_image = "bat_3dladder.png",
        paramtype = "light",
        paramtype2 = "facedir",
		  sunlight_propagates = true,
        walkable = true,
        climbable = true,
        node_box = {
                type = "fixed",
                fixed = {
                        {-0.375000,-0.500000,0.375000,-0.250000,0.500000,0.500000}, --NodeBox 1
                        {0.250000,-0.500000,0.375000,0.375000,0.500000,0.500000}, --NodeBox 2
                        {-0.250000,0.437500,0.375000,0.250000,0.312500,0.500000}, --NodeBox 3
                        {-0.250000,0.062500,0.375000,0.250000,0.187500,0.500000}, --NodeBox 4
                        {-0.250000,-0.187500,0.375000,0.250000,-0.062500,0.500000}, --NodeBox 5
                        {-0.250000,-0.437500,0.375000,0.250000,-0.312500,0.500000}, --NodeBox 6
                },
        },
        selection_box = {
                type = "fixed",
                fixed = {
                {-0.375,-0.5,0.375,0.375,0.5,0.5},
        },
        },
        groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
        legacy_wallmounted = true,
        sounds = default.node_sound_wood_defaults(),
})

--Crafting
---------------------------------------------------------

-- Bat Ladder

minetest.register_craft({
	output = "bat_ladders:bat_ladder 2",
	recipe = {
		{'bat_blocks:bat_rod_black', '', 'bat_blocks:bat_rod_black'},
		{'bat_blocks:bat_rod_black', 'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_black'},
		{'bat_blocks:bat_rod_black', '', 'bat_blocks:bat_rod_black'}
	}
})

--Bat 3d Ladder

minetest.register_craft({
	output = "bat_ladders:bat_3dladder 2",
	recipe = {
		{'bat_blocks:bat_rod_black', '', 'bat_blocks:bat_rod_black'},
		{'bat_blocks:bat_rod_black', 'bat_blocks:bat_rod_black', 'bat_blocks:bat_rod_black'},
		{'bat_blocks:bat_rod_black', '', 'bat_blocks:bat_rod_black'}
	}
})
