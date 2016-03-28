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
			tmp_node = {name="cutepie:cute_block", param1=me.param1, param2=me.param2}
		else
			state = 1
			tmp_node = {name="cutepie:cute_block_light", param1=me.param1, param2=me.param2}
		end
		update_node(pos, tmp_node)
		meta:set_int("state", state)
end


minetest.register_node("cutepie:cute_block", {
	description = "Cutepie Block",
	drawtype = "normal",
	tiles = {"cute_block_tb.png","cute_block_tb.png","cute_block_frown.png","cute_block_frown.png","cute_block_frown.png","cute_block_frown.png"},
	paramtype = "light",
  	paramtype2 = "facedir",
	groups = {cracky = 2 , oddly_breakable_by_hand = 1},
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})
--cute block light

minetest.register_node("cutepie:cute_block_light", {
	drawtype = "normal",
	tiles = {"cute_block_tb.png","cute_block_tb.png","cute_block.png","cute_block.png","cute_block.png","cute_block.png"},
	paramtype = "light",
  	paramtype2 = "facedir",
	light_source = 14,
	groups = {cracky = 2 , oddly_breakable_by_hand = 1},
	drop = "cutepie:cute_block",
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

