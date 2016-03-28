
minetest.register_craft({
	output = "bat_blocks:bat_brick 4",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', ''}
	}
})

minetest.register_craft({
	output = "bat_blocks:bat_smbrick 4",
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow', 'bat_blocks:bat_color_black'},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_color_black', 'bat_blocks:bat_color_yellow'}
	}
})


