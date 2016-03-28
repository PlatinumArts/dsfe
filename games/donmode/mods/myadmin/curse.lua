 local bad_words = {
"examplebadwords",
"examplebadwordsend"
}
minetest.register_on_chat_message(function(name, message)
	if not message then return end
	local msg = message:lower()
		for _, word in pairs(bad_words) do
			if msg:find(word) then
				minetest.kick_player(name, "( ** WATCH YOUR LANGUAGE ** )")
				return
			end
		end
	end)
