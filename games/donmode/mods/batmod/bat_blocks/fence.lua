
--Bat Fences

-- Bat Black fence
	minetest.register_node("bat_blocks:bat_fence_black", {
		description = "Bat Fence Black",
		drawtype = "fencelike",
		tiles = {"bat_color_black.png"},
		inventory_image = "bat_fence_black_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat White fence
	minetest.register_node("bat_blocks:bat_fence_white", {
		description = "Bat Fence White",
		drawtype = "fencelike",
		tiles = {"bat_color_white.png"},
		inventory_image = "bat_fence_white_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Yellow fence
	minetest.register_node("bat_blocks:bat_fence_yellow", {
		description = "Bat Fence Yellow",
		drawtype = "fencelike",
		tiles = {"bat_color_yellow.png"},
		inventory_image = "bat_fence_yellow_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Blue fence
	minetest.register_node("bat_blocks:bat_fence_blue", {
		description = "Bat Fence Blue",
		drawtype = "fencelike",
		tiles = {"bat_color_blue.png"},
		inventory_image = "bat_fence_blue_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Green fence
	minetest.register_node("bat_blocks:bat_fence_green", {
		description = "Bat Fence Green",
		drawtype = "fencelike",
		tiles = {"bat_color_green.png"},
		inventory_image = "bat_fence_green_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Red fence
	minetest.register_node("bat_blocks:bat_fence_red", {
		description = "Bat Fence Red",
		drawtype = "fencelike",
		tiles = {"bat_color_red.png"},
		inventory_image = "bat_fence_red_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Beige fence
	minetest.register_node("bat_blocks:bat_fence_beige", {
		description = "Bat Fence Beige",
		drawtype = "fencelike",
		tiles = {"bat_color_beige.png"},
		inventory_image = "bat_fence_beige_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})


-- Bat Orange fence
	minetest.register_node("bat_blocks:bat_fence_orange", {
		description = "Bat Fence Orange",
		drawtype = "fencelike",
		tiles = {"bat_color_orange.png"},
		inventory_image = "bat_fence_orange_inv.png",
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		stack_max = 500,
		sounds = default.node_sound_stone_defaults(),
	})

--Crafts

--black
minetest.register_craft({
		output = "bat_blocks:bat_fence_black 6",
		recipe = {
			{'','bat_blocks:bat_color_black',''},
			{'','bat_blocks:bat_color_black',''},
			{'','bat_blocks:bat_color_black',''}
			}
	})

--white
minetest.register_craft({
		output = "bat_blocks:bat_fence_white 6",
		recipe = {
			{'','bat_blocks:bat_color_white',''},
			{'','bat_blocks:bat_color_white',''},
			{'','bat_blocks:bat_color_white',''}
			}
	})

--yellow
minetest.register_craft({
		output = "bat_blocks:bat_fence_yellow 6",
		recipe = {
			{'','bat_blocks:bat_color_yellow',''},
			{'','bat_blocks:bat_color_yellow',''},
			{'','bat_blocks:bat_color_yellow',''}
			}
	})

--blue
minetest.register_craft({
		output = "bat_blocks:bat_fence_blue 6",
		recipe = {
			{'','bat_blocks:bat_color_blue',''},
			{'','bat_blocks:bat_color_blue',''},
			{'','bat_blocks:bat_color_blue',''}
			}
	})

--green
minetest.register_craft({
		output = "bat_blocks:bat_fence_green 6",
		recipe = {
			{'','bat_blocks:bat_color_green',''},
			{'','bat_blocks:bat_color_green',''},
			{'','bat_blocks:bat_color_green',''}
			}
	})

--red
minetest.register_craft({
		output = "bat_blocks:bat_fence_red 6",
		recipe = {
			{'','bat_blocks:bat_color_red',''},
			{'','bat_blocks:bat_color_red',''},
			{'','bat_blocks:bat_color_red',''}
			}
	})

--beige
minetest.register_craft({
		output = "bat_blocks:bat_fence_beige 6",
		recipe = {
			{'','bat_blocks:bat_color_beige',''},
			{'','bat_blocks:bat_color_beige',''},
			{'','bat_blocks:bat_color_beige',''}
			}
	})

--orange
minetest.register_craft({
		output = "bat_blocks:bat_fence_orange 6",
		recipe = {
			{'','bat_blocks:bat_color_orange',''},
			{'','bat_blocks:bat_color_orange',''},
			{'','bat_blocks:bat_color_orange',''}
			}
	})
