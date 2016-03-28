
--Pick
minetest.register_tool("bat_tools:bat_pick", {
	description = "Bat Pick",
	inventory_image = "batpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	stack_max = 1,
	}
})

minetest.register_alias("batmod:bat_pick", "bat_tools:bat_pick")

--Shovel
minetest.register_tool("bat_tools:bat_shovel", {
	description = "Bat Shovel",
	inventory_image = "batshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	stack_max = 1,
	}
})

minetest.register_alias("batmod:bat_shovel", "bat_tools:bat_shovel")

--Axe
minetest.register_tool("bat_tools:bat_axe", {
	description = "Bat Axe",
	inventory_image = "bataxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	stack_max = 1,
	}
})

minetest.register_alias("batmod:bat_axe", "bat_tools:bat_axe")

--Sword
minetest.register_tool("bat_tools:bat_sword", {
	description = "Bat Sword",
	inventory_image = "batsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	stack_max = 1,
	}
})

minetest.register_alias("batmod:bat_sword", "bat_tools:bat_sword")

--Bat_tle Axe
minetest.register_tool("bat_tools:bat_tleaxe", {
	description = "Bat_tleaxe",
	inventory_image = "bat_tleaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	stack_max = 1,
	}
})

minetest.register_alias("batmod:bat_tleaxe", "bat_tools:bat_tleaxe")

--Bat Hoe

farming.register_hoe(":bat_tools:bat_hoe", {
	description = "Bat Hoe",
	inventory_image = "bathoe.png",
  	stack_max = 1,
	max_uses = 500,
	recipe = {
		{"bat_blocks:bat_rod_yellow", "bat_blocks:bat_rod_yellow"},
		{"", "bat_blocks:bat_rod_black"},
		{"", "bat_blocks:bat_rod_black"},
	}
})



--Crafting
---------------------------------------------------------------------------------------

--Pick

minetest.register_craft({
	output = "bat_tools:bat_pick",
	recipe = {
		{'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_yellow'},
		{'', 'bat_blocks:bat_rod_black', ''},
		{'', 'bat_blocks:bat_rod_black', ''}
	}
})

--Axe

minetest.register_craft({
	output = "bat_tools:bat_axe 1",
	recipe = {
		{'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_yellow', ''},
		{'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_black', ''},
		{'', 'bat_blocks:bat_rod_black', ''}
	}
})

--Shovel

minetest.register_craft({
	output = "bat_tools:bat_shovel 1",
	recipe = {
		{'', 'bat_blocks:bat_rod_yellow', ''},
		{'', 'bat_blocks:bat_rod_black', ''},
		{'', 'bat_blocks:bat_rod_black', ''}
	}
})


--Sword

minetest.register_craft({
	output = "bat_tools:bat_sword 1",
	recipe = {
		{'', 'bat_blocks:bat_rod_yellow', ''},
		{'', 'bat_blocks:bat_rod_yellow', ''},
		{'', 'bat_blocks:bat_rod_black', ''}
	}
})

--Bat_tleaxe

minetest.register_craft({
	output = "bat_tools:bat_tleaxe 1",
	recipe = {
		{'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_black', 'bat_blocks:bat_rod_yellow'},
		{'bat_blocks:bat_rod_yellow', 'bat_blocks:bat_rod_black', 'bat_blocks:bat_rod_yellow'},
		{'', 'bat_blocks:bat_rod_black', ''}
	}
})



