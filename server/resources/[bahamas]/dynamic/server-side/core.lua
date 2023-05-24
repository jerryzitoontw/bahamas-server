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
Tunnel.bindInterface("dynamic",Bahamas)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Works = {
	["Driver"] = "Motorista",
	["Delivery"] = "Entregador",

	["Dismantle"] = "Desmanche",
	["Tows"] = "Reboque",

	["Transporter"] = "Transportador",
	["Lumberman"] = "Lenhador"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.Experience()
	local source = source
	local Passport = vRP.Passport(source)
	local Datatable = vRP.Datatable(Passport)
	if Passport and Datatable then
		local Experiences = {}

		for Index,v in pairs(Works) do
			if Datatable[Index] then
				Experiences[v] = Datatable[Index]
			else
				Experiences[v] = 0
			end
		end

		return Experiences
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXCLUSIVAS
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.Exclusivas()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Clothes = {}
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)

		for Index,v in pairs(Consult) do
			Clothes[#Clothes + 1] = { ["name"] = Index, ["id"] = v["id"], ["texture"] = v["texture"] or 0, ["type"] = v["type"] }
		end

		return Clothes
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TENCODES
-----------------------------------------------------------------------------------------------------------------------------------------
local Tencodes = {
	[13] = {
		text = "Oficial desmaiado/ferido",
		blip = 1
	},
	[20] = {
		text = "Localização",
		blip = 38
	},
	[38] = {
		text = "Abordagem de trânsito",
		blip = 83
	},
	[78] = {
		text = "Apoio com prioridade",
		blip = 4
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:Tencode")
AddEventHandler("dynamic:Tencode",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local Service = vRP.NumPermission("Police")
		for Passports,Sources in pairs(Service) do
			async(function()
				TriggerClientEvent("NotifyPush",Sources,{ code = Code, title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
			end)
		end
	end
end)
