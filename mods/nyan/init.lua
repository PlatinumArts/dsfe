minetest.register_abm({
	nodenames = {"default:nyancat"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local dir = minetest.facedir_to_dir(node.param2)	
		local infrontof = {x=pos.x - dir.x, y=pos.y - dir.y, z=pos.z - dir.z}	
		if minetest.get_node(infrontof).name == "air" then
			minetest.set_node(pos, {name = "nyan:rainbow", param2 = node.param2})
			minetest.set_node(infrontof, {name = "default:nyancat", param2 = node.param2})
		else 
			minetest.set_node(pos, {name = "default:nyancat", param2 = (node.param2+1) % 24})
		end
	end
})

minetest.register_node("nyan:rainbow", {
	tiles = {
		"default_nc_rb.png^[transformR90", "default_nc_rb.png^[transformR90",
		"default_nc_rb.png", "default_nc_rb.png"
	},
	paramtype2 = "facedir",
	light_source = 4,
	groups = {dig_immediate = 3},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
	drop = ""
})