-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Timer = 0
local Select = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
local Crafting = {
	-- Framework
	["1"] = { vec3(713.66,-961.04,30.4),"Dress" },
	["2"] = { vec3(-382.72,261.91,86.36),"Food" },
	["3"] = { vec3(1991.28,3724.65,34.83),"Food" },
	["4"] = { vec3(82.45,-1553.26,29.59),"Lixeiro" },
	["5"] = { vec3(287.36,2843.6,44.7),"Lixeiro" },
	["6"] = { vec3(-413.68,6171.99,31.48),"Lixeiro" },
	["7"] = { vec3(2921.17,2653.46,43.31),"Mining" },
	["8"] = { vec3(894.5,-962.71,35.63),"Money" },
	["9"] = { vec3(1209.28,-3115.1,5.61),"Weapons" },
	-- Restaurants
	["10"] = { vec3(-1847.16,-1194.05,14.28),"Pearls" },
	-- Contraband
	["11"] = { vec3(2186.77,5581.2,53.9),"Chiliad" },
	["12"] = { vec3(-161.72,-1609.33,33.46),"Families" },
	["13"] = { vec3(1421.29,6328.41,23.87),"Highways" },
	["14"] = { vec3(325.69,-1997.49,24.02),"Vagos" },
	-- Favelas
	["15"] = { vec3(1356.56,-259.51,152.02),"Barragem" },
	["16"] = { vec3(3176.13,5142.38,31.51),"Farol" },
	["17"] = { vec3(402.93,756.95,194.62),"Parque" },
	["18"] = { vec3(2175.04,4045.95,34.36),"Sandy" },
	["19"] = { vec3(1550.16,-2454.24,80.37),"Petroleo" },
	["20"] = { vec3(-3110.99,1422.21,29.97),"Praia-1" },
	["21"] = { vec3(-3130.2,1702.83,41.01),"Praia-2" },
	["22"] = { vec3(-601.03,2197.69,126.27),"Zancudo" },
	-- Mafias
	["23"] = { vec3(1400.84,1138.64,109.63),"Madrazzo" },
	["24"] = { vec3(-1543.54,79.91,57.00),"Playboy" },
	["25"] = { vec3(951.87,-116.01,74.99),"TheSouth" },
	["26"] = { vec3(-1871.2,2061.28,135.28),"Vineyard" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Crafting) do
		exports["target"]:AddCircleZone("Crafting:"..Number, v[1], 1.0, {
			name = "Crafting:"..Number,
			heading = 3374176
		},{
			shop = Number,
			Distance = 1.0,
			options = {
				{
					event = "crafting:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:Open", function(Number)
	local v = Crafting[Number]
	if v then
		if vSERVER.Permission(v[2]) then
			if v[2] ~= Select and GetGameTimer() < Timer then
				TriggerEvent("Notify", "amarelo", "Produção em andamento.", 5000)
			else
				Select = v[2]
				SetNuiFocus(true, true)
				SendNUIMessage({ action = "OpenCraft", data = vSERVER.Request(Select) })
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OWNED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Owned",function(Data,Callback)
	Callback(vSERVER.Owned(Data["id"],Data["key"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Crafting",function(Data,Callback)
	if GetGameTimer() >= Timer then
		Timer = GetGameTimer() + Data["time"] * 1000

		SetTimeout(Data["time"] * 1000,function()
			vSERVER.Crafting(Data["id"],Data["key"],Data["amount"])
		end)

		Callback(true)
	else
		TriggerEvent("Notify","amarelo","Produção em andamento.",5000)
		Callback(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:INVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Inventory")
AddEventHandler("crafting:Inventory",function()
	if "Inventory" ~= Select and GetGameTimer() < Timer then
		TriggerEvent("Notify","amarelo","Produção em andamento.",5000)
		return
	end

	Select = "Inventory"
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "OpenCraft", data = vSERVER.Request("Inventory") })
end)