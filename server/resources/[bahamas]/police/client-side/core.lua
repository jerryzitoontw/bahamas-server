-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Bahamas = {}
Tunnel.bindInterface("police",Bahamas)
vSERVER = Tunnel.getInterface("police")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("initPrison",function(data)
	vSERVER.initPrison(data["passaporte"],data["servicos"],data["multas"],data["texto"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITFINE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("initFine",function(data)
	vSERVER.initFine(data["passaporte"],data["multas"],data["texto"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updatePort",function(data)
	vSERVER.updatePort(data["passaporte"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHUSER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("searchUser",function(data,cb)
	cb({ result = vSERVER.searchUser(data["passaporte"]) })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("police:Update")
AddEventHandler("police:Update",function(action,data)
	SendNUIMessage({ action = action, data = data })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inPrison = false
local coordsIntern = { 1679.94,2513.07,45.56 }
local coordsExtern = { 1896.15,2604.44,45.75 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
exports("checkPrison",function()
	return inPrison
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNC
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.Sync(Status,Teleport)
	if Teleport then
		if Status then
			SetEntityCoords(PlayerPedId(),coordsIntern[1],coordsIntern[2],coordsIntern[3],1,0,0,0)
		else
			SetEntityCoords(PlayerPedId(),coordsExtern[1],coordsExtern[2],coordsExtern[3],1,0,0,0)
		end
	end

	inPrison = Status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REDUCES
-----------------------------------------------------------------------------------------------------------------------------------------
local reduceList = {
	["1"] = { 1698.86,2472.69,45.56 },
	["2"] = { 1698.48,2472.36,45.56 },
	["3"] = { 1635.66,2490.23,45.56 },
	["4"] = { 1634.63,2490.1,45.56 },
	["5"] = { 1618.41,2521.55,45.56 },
	["6"] = { 1607.39,2541.39,45.56 },
	["7"] = { 1606.3,2542.63,45.56 },
	["8"] = { 1624.83,2567.86,45.56 },
	["9"] = { 1624.78,2567.12,45.56 },
	["10"] = { 1643.77,2565.0,45.56 },
	["11"] = { 1665.05,2567.68,45.56 },
	["12"] = { 1715.97,2567.16,45.56 },
	["13"] = { 1715.97,2567.95,45.56 },
	["14"] = { 1716.02,2568.78,45.56 },
	["15"] = { 1768.79,2565.76,45.56 },
	["16"] = { 1769.77,2565.7,45.56 },
	["17"] = { 1772.72,2536.83,45.56 },
	["18"] = { 1758.19,2508.99,45.56 },
	["19"] = { 1757.87,2507.77,45.56 },
	["20"] = { 1719.9,2502.66,45.56 },
	["21"] = { 1695.28,2506.62,45.56 },
	["22"] = { 1663.84,2515.34,45.56 },
	["23"] = { 1664.44,2516.1,45.56 },
	["24"] = { 1628.63,2543.64,45.56 },
	["25"] = { 1636.16,2553.61,45.56 },
	["26"] = { 1648.41,2536.3,45.56 },
	["27"] = { 1657.61,2549.28,45.56 },
	["28"] = { 1649.78,2538.35,45.56 },
	["29"] = { 1699.18,2535.8,45.56 },
	["30"] = { 1699.57,2534.67,45.56 },
	["31"] = { 1699.39,2532.1,45.56 },
	["32"] = { 1777.42,2560.84,45.66 },
	["33"] = { 1784.21,2561.16,45.66 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(reduceList) do
		exports["target"]:AddCircleZone("police:"..Number,vec3(v[1],v[2],v[3]),0.75,{
			name = "police:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.0,
			options = {
				{
					event = "police:Reduces",
					tunnel = "server",
					label = "Vasculhar"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("police:Open")
AddEventHandler("police:Open",function()
	local Ped = PlayerPedId()
	if not IsPedSwimming(Ped) then
		SendNUIMessage({ action = "openSystem" })
		TriggerEvent("dynamic:closeSystem")
		SetNuiFocus(true,true)

		if not IsPedInAnyVehicle(Ped) then
			vRP.Destroy()
			vRP.CreateObjects("amb@code_human_in_bus_passenger_idles@female@tablet@base","base","prop_cs_tablet",50,28422)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "closeSystem" })
	vRP.Destroy()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESCAPEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.EscapePrison()
	LocalPlayer["state"]:set("Buttons",true,true)
	LocalPlayer["state"]:set("Commands",true,true)
	TriggerEvent("hud:Active",false)
	DoScreenFadeOut(1000)
	Wait(5000)

	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),false))
	RequestCutscene("apa_fin_cel_apt3",8)
	while not (HasCutsceneLoaded()) do
		Wait(0)
	end
	
	DoScreenFadeIn(1000)

	local Model = GetHashKey("ig_stretch")
	RequestModel(Model)
	while not LoadModel(Model) do
		RequestModel(Model)
		Wait(0)
	end
	
	local Ped = CreatePed(7,Model,x,y,z,0.0,false,false)
	local Model2 = GetHashKey("ig_rashcosvki")
	RequestModel(Model2)
	while not LoadModel(Model2) do
		RequestModel(Model2)
		Wait(0)
	end

	local Ped2 = CreatePed(7,Model2,x,y,z,0.0,false,false)
	local Model3 = GetHashKey("u_m_y_prisoner_01")
	RequestModel(Model3)
	while not LoadModel(Model3) do
		RequestModel(Model3)
		Wait(0)
	end

	local Ped3 = CreatePed(7,Model3,x,y,z,0.0,false,false)
	SetCutsceneEntityStreamingFlags("MP_1",0,1)
	RegisterEntityForCutscene(Ped,"MP_1",0,0,64)
	SetCutsceneEntityStreamingFlags("MP_2",0,1)
	RegisterEntityForCutscene(PlayerPedId(),"MP_2",0,0,64)
	SetCutsceneEntityStreamingFlags("MP_3",0,1)
	RegisterEntityForCutscene(Ped2,"MP_3",0,0,64)
	SetCutsceneEntityStreamingFlags("MP_4",0,1)
	RegisterEntityForCutscene(Ped3,"MP_4",0,0,64)

	StartCutscene(0)

	while not (DoesCutsceneEntityExist("MP_2",0)) do
		Wait(0)
	end

	while not (DoesCutsceneEntityExist("MP_1",0)) do
		Wait(0)
	end

	while not (DoesCutsceneEntityExist("MP_3",0)) do
		Wait(0)
	end

	while not (DoesCutsceneEntityExist("MP_4",0)) do
		Wait(0)
	end

	SetCutsceneEntityStreamingFlags("MP_2",0,1)
	RegisterEntityForCutscene(PlayerPedId(),"MP_2",0,0,64)
	SetCutscenePedComponentVariationFromPed(PlayerPedId(),GetPlayerPed(-1),1885233650)

	while not (HasCutsceneFinished()) do
		Wait(0)
	end

	DoScreenFadeOut(0)

	Wait(2000)

	if DoesEntityExist(Ped) then
		DeletePed(Ped)
	end

	if DoesEntityExist(Ped2) then
		DeletePed(Ped2)
	end

	if DoesEntityExist(Ped3) then
		DeletePed(Ped3)
	end

	SetEntityCoordsNoOffset(PlayerPedId(),346.84,440.68,147.71,300.48)
	DoScreenFadeIn(2000)

	TriggerEvent("hud:Active",true)
	LocalPlayer["state"]:set("Buttons",false,true)
	LocalPlayer["state"]:set("Commands",false,true)
end