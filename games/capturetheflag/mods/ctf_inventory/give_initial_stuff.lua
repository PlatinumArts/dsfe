function give_initial_stuff(player)
	if minetest.setting_getbool("give_initial_stuff") then
		minetest.log("action", "Giving initial stuff to player "..player:get_player_name())
		local inv = player:get_inventory()
		inv:set_list("main", {})
		inv:set_list("craft", {})
		inv:add_item('main', 'default:pick_wood')
		inv:add_item('main', 'shooter:flare 20')
		inv:add_item('main', 'default:torch 3')
		inv:add_item('main', 'shooter:grapple_gun')
		inv:add_item('main', 'shooter:grapple_hook 20')
		inv:add_item('main', 'shooter:flaregun')
		--inv:add_item('main', 'shooter:ammo 20')
	end
end

minetest.register_on_joinplayer(function(player)
	player:set_hp(20)
	give_initial_stuff(player)
end)
minetest.register_on_respawnplayer(give_initial_stuff)
