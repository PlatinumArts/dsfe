
ctf.gui.register_tab("settings", "Settings", function(name, team)
	local color = ""
	if ctf.team(team).data.color then
		color = ctf.team(team).data.color
	end

	local result = "field[3,2;4,1;color;Team Color;" .. color .. "]" ..
		"button[4,6;2,1;save;Save]"


	if not ctf.can_mod(name,team) then
		result = "label[0.5,1;You do not own this team!"
	end

	minetest.show_formspec(name, "ctf:settings",
		"size[10,7]" ..
		ctf.gui.get_tabs(name, team) ..
		result
	)
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "ctf:settings" then
		return false
	end

	-- Settings page
	if fields.save then
		ctf.gui.show(name, "settings")

		if ctf.flag_colors[fields.color] then
			team.data.color = fields.color
			ctf.needs_save = true
		else
			local colors = ""
			for color, code in pairs(ctf.flag_colors) do
				if colors ~= "" then
					colors = colors .. ", "
				end
				colors = colors .. color
			end
			minetest.chat_send_player(name, "Color " .. fields.color ..
					" does not exist! Available: " .. colors)
		end

		return true
	end
end)
