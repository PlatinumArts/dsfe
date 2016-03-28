
-- Bat Bounce--------------------------------------------------------------------

minetest.register_node("bat_blocks:bat_bounce", {
	description = "Bat Bounce",
	drawtype = "normal",
	tiles = {"bat_bounce.png"},
	paramtype = "light",
	groups = {cracky = 3, bouncy = 70,  fall_damage_add_percent = -1000},
	sounds = default.node_sound_stone_defaults(),

})
--Craft

minetest.register_craft({
		output = "bat_blocks:bat_bounce",
	recipe = {
		{'bat_blocks:bat_rubber_sheet', 'bat_blocks:bat_rubber_sheet', 'bat_blocks:bat_rubber_sheet'},
		{'bat_blocks:bat_rubber_sheet', 'bat_blocks:bat_color_black', 'bat_blocks:bat_rubber_sheet'},
		{'bat_blocks:bat_rubber_sheet', 'bat_blocks:bat_rubber_sheet', 'bat_blocks:bat_rubber_sheet'}
		}
	})

-- Bat no Bounce----------------------------------------------------------------------

minetest.register_node("bat_blocks:bat_bounce_not", {
	description = "Bat No Bounce",
	drawtype = "normal",
	tiles = {"bat_bounce_not.png"},
	paramtype = "light",
	groups = {cracky = 3, disable_jump = 1,  fall_damage_add_percent = -1000},
	sounds = default.node_sound_stone_defaults(),

})

--Craft

minetest.register_craft({
		output = "bat_blocks:bat_bounce_not",
	recipe = {
		{'bat_blocks:bat_glue', 'bat_blocks:bat_glue', 'bat_blocks:bat_glue'},
		{'bat_blocks:bat_glue', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_glue'},
		{'bat_blocks:bat_glue', 'bat_blocks:bat_glue', 'bat_blocks:bat_glue'}
		}
	})

-- Bat Glue-------------------------------------------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_glue", {
	description = "Bat Glue",
	inventory_image = "bat_glue.png",

})

-- Craft

minetest.register_craft({
		type = "cooking",
		output = "bat_blocks:bat_glue",
		recipe = "bat_blocks:bat_rod_yellow",
		cooktime = 3
	})


-- Bat Rubber Raw-----------------------------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_rubber_raw", {
	description = "Bat Rubber Raw",
	inventory_image = "bat_rubber_raw.png",

})

-- Crafts

--Bat Rubber Raw Walkable Lava

minetest.register_craft({
		output = "bat_blocks:bat_rubber_raw",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_lava:bat_lava_w', ''},
		{'', '', ''},
		{'', '', ''}
		}
	})

--Bat Rubber Raw Not Walkable Lava

minetest.register_craft({
		output = "bat_blocks:bat_rubber_raw",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_lava:bat_lava_nw', ''},
		{'', '', ''},
		{'', '', ''}
		}
	})
--Bat Rubber Raw Not Default Lava

minetest.register_craft({
		output = "bat_blocks:bat_rubber_raw",
	recipe = {
		{'bat_blocks:bat_color_black', 'default:lava_source', ''},
		{'', '', ''},
		{'', '', ''}
		}
	})

-- Bat Rubber Sheet--------------------------------------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_rubber_sheet", {
	description = "Bat Rubber Sheet",
	inventory_image = "bat_rubber_sheet.png",

})


--Craft

minetest.register_craft({
		output = "bat_blocks:bat_rubber_sheet",
	recipe = {
		{'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw'},
		{'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw'},
		{'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw', 'bat_blocks:bat_rubber_raw'}
		}
	})



