-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Bahamas = {}
Tunnel.bindInterface("tattoos",Bahamas)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKWANTED
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.CheckWanted()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Wanted(Passport,source) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.updateTattoo(Tattoos)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Tables = json.encode(Tattoos)
		if Tables ~= "[]" then
			vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Tatuagens", dvalue = Tables })
		end
	end
end