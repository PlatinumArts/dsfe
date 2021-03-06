dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:crafting", {
	title = "Crafting",
	is_in_nav = function(player, context)
		return true
	end,
	get = function(player, context)
		return [[ {{ layout }}
			list[current_player;craft;1.75,0.5;3,3;]
			list[current_player;craftpreview;5.75,1.5;1,1;]
			image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]
			listring[current_player;main]
			listring[current_player;craft]
			image[0,4.25;1,1;gui_hb_bg.png]
			image[1,4.25;1,1;gui_hb_bg.png]
			image[2,4.25;1,1;gui_hb_bg.png]
			image[3,4.25;1,1;gui_hb_bg.png]
			image[4,4.25;1,1;gui_hb_bg.png]
			image[5,4.25;1,1;gui_hb_bg.png]
			image[6,4.25;1,1;gui_hb_bg.png]
			image[7,4.25;1,1;gui_hb_bg.png] ]]
	end,
	on_player_receive_fields = function(player, context, fields)
		print("Received!")
	end,
	on_leave = function(player, context)
		print("Left page!")
	end
})
