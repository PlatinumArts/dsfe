local function update_node(pos, node) 
	minetest.set_node(pos, node)
end

local function punch(pos)
	local meta = minetest.get_meta(pos)
	local state = meta:get_int("state")
	local me = minetest.get_node(pos)
	local tmp_node
	local tmp_node2
	oben = {x=pos.x, y=pos.y, z=pos.z}
		if state == 1 then
			state = 0
			tmp_node = {name="cutepie:cute_block2", param1=me.param1, param2=me.param2}
		else
			state = 1
			tmp_node = {name="cutepie:cute_block_light2", param1=me.param1, param2=me.param2}
		end
		update_node(pos, tmp_node)
		meta:set_int("state", state)
end

minetest.register_node("cutepie:cute_block2", {
	description = "Cutepie Block 2",
	drawtype = "normal",
	tiles = {"cute_block2_tb.png","cute_block2_tb.png","cute_block2_frown.png","cute_block2_frown.png","cute_block2_frown.png","cute_block2_frown.png"},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2 , oddly_breakable_by_hand = 1},
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})
--cute block light

minetest.register_node("cutepie:cute_block_light2", {
--	description = "Cutepie Block Light",
	drawtype = "normal",
	tiles = {"cute_block2_tb.png","cute_block2_tb.png","cute_block2.png","cute_block2.png","cute_block2.png","cute_block2.png"},
	paramtype = "light",
  	paramtype2 = "facedir",
	light_source = 14,
	groups = {cracky = 2 , oddly_breakable_by_hand = 1},
	drop = "cutepie:cute_block2",
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})
