

-- Black Rod-----------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_rod_black", {
	description = "Black Rod",
	inventory_image = "bat_blackrod.png",

})

--Craft

minetest.register_craft({
		type = "cooking",
		output = "bat_blocks:bat_rod_black 4",
		recipe = "bat_blocks:bat_color_black",
		cooktime = 2
	})

-- Yellow Rod----------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_rod_yellow", {
	description = "Yellow Rod",
	inventory_image = "bat_yellowrod.png",

})

--Craft

minetest.register_craft({
		type = "cooking",
		output = "bat_blocks:bat_rod_yellow 4",
		recipe = "bat_blocks:bat_color_yellow",
		cooktime = 2
	})

-- White Rod-----------------------------------------------------

minetest.register_craftitem("bat_blocks:bat_rod_white", {
	description = "White Rod",
	inventory_image = "bat_whiterod.png",

})

--Craft

minetest.register_craft({
		type = "cooking",
		output = "bat_blocks:bat_rod_white 4",
		recipe = "bat_blocks:bat_color_white",
		cooktime = 2
	})

-- Bat White Powder

minetest.register_craftitem("bat_blocks:bat_white_powder", {
	description = "Bat White Powder",
	inventory_image = "bat_white_powder.png",
})


--Craft

minetest.register_craft({
		type = "cooking",
		output = "bat_blocks:bat_white_powder",
		recipe = "bat_blocks:bat_cobble_white",
		cooktime = 4
	})
