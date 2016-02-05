
-- ADDED WASTE
minetest.register_craftitem("mikesmod:waste", {
	description = "Waste",
	inventory_image = "mikesmod_waste.png",
	--groups={waste},
})

-- PLAYER JOIN MESSAGE
minetest.register_on_joinplayer(function(player)
	minetest.chat_send_all("Welcome "..player:get_player_name().."! Press I for your inventory!  Press escape to open the game menu.")
end)

-- HITTING A BRICK CREATES A GLOBAL MESSAGE
minetest.register_on_punchnode(
	function(pos, node, puncher)
		if node.name == "default:brick" then
			local name = puncher:get_player_name()
			minetest.chat_send_all("Hey " .. name .. ", why are you hitting me?")
		end
	end	
)

--[[
minetest.register_on_item_eat(
	function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	itemstack:take_item()
	itemstack:add_item('mikesmod:waste')
	return itemstack
end
)

-- PLAY CODE
--[[
minetest.after(10,
	function(params)
		minetest.chat_send_all(" Welcome to the Modern City Builder Gametype.  Press I for your inventory!  Press escape to open the game menu.")
	end
)
--]]

--[[
if gametime == 6000
for _,player in ipairs(minetest.get_connected_players()) do
	local name = player:get_player_name()
	set_wielded_item(Waste)
--]]