minetest.register_craftitem("mikesmod:waste", {
	description = "Waste",
	inventory_image = "mikesmod_waste.png",
	--groups={waste},
})

--[[
minetest.after(10,
	function(params)
		minetest.chat_send_all(" Welcome to the Modern City Builder Gametype.  Press I for your inventory!  Press escape to open the game menu.")
	end
)
--]]

minetest.register_on_joinplayer(function(player)
	minetest.chat_send_all("Welcome "..player:get_player_name().."! Press I for your inventory!  Press escape to open the game menu.")
end)

minetest.register_on_punchnode(
	function(pos, node, puncher)
		if node.name == "default:brick" then
			local name = puncher:get_player_name()
			minetest.chat_send_all("Hey " .. name .. ", why are you hitting me?")
		end
	end	
)