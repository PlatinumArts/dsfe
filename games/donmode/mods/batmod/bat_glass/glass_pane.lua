
--Glass Pane

minetest.register_node("bat_glass:bat_glass_pane", {
	description = "Bat Glass Pane",
	tiles = {
		"bat_glass_glass3.png",
		"bat_glass_glass3.png",
		"bat_glass_glass3.png",
		"bat_glass_glass3.png",
		"bat_glass_glass2.png",
		"bat_glass_glass2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.1875}, -- NodeBox1
		}
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

--craft
minetest.register_craft({
		output = "bat_glass:bat_glass_pane 6",
		recipe = {
			{'bat_glass:bat_glass_white','bat_glass:bat_glass_white','bat_glass:bat_glass_white'},
			{'','',''},
			{'','',''}
			}
	})
