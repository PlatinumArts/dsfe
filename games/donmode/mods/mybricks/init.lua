mybricks = {}
dofile(minetest.get_modpath("mybricks").."/bricks.lua")
dofile(minetest.get_modpath("mybricks").."/machine.lua")
dofile(minetest.get_modpath("mybricks").."/register.lua")


local mod_hardenedclay = minetest.get_modpath("hardenedclay")
local mod_ores = minetest.get_modpath("ores")

if mod_hardenedclay then
	dofile(minetest.get_modpath("mybricks").."/hardenedclay.lua")
	
	end

if mod_ores then
	dofile(minetest.get_modpath("mybricks").."/ores.lua")
	
	end





