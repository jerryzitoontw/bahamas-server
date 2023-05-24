-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Bahamas = {}
Tunnel.bindInterface("police",Bahamas)
vCLIENT = Tunnel.getInterface("police")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Reduces = {}
local Actived = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.initPrison(OtherPassport,services,fines,text)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Actived[Passport] == nil then
			Actived[Passport] = true

			local Identity = vRP.Identity(Passport)
			if Identity then
				local OtherPlayer = vRP.Source(OtherPassport)
				if OtherPlayer then
					vRP.Teleport(OtherPlayer,1691.53,2565.91,45.56)
					TriggerClientEvent("radio:RadioClean",OtherPlayer)
					TriggerEvent("markers:Add",OtherPlayer,"Prisioneiro")
					TriggerClientEvent("Notify",OtherPlayer,"Sistema Penitenciário","Você deve cumprir <b>"..parseInt(services).." serviços</b>.","default",10000)
				end

				vRP.Query("prison/InsertPrison",{ police = Identity["name"].." "..Identity["name2"], OtherPassport = parseInt(OtherPassport), services = services, fines = fines, text = text, date = os.date("%d/%m/%Y").." ás "..os.date("%H:%M") })
				TriggerClientEvent("Notify",source,"Sucesso","Prisão efetuada.","verde",5000)
				TriggerClientEvent("police:Update",source,"reloadPrison")
				vRP.InitPrison(OtherPassport,services)

				if fines > 0 then
					vRP.GiveFine(OtherPassport,fines)

					if NewBank then
						exports["bank"]:AddFines(Passport,OtherPassport,fines,text)
					end
				end

				TriggerEvent("Discord","Prison","**Por:** "..parseFormat(Passport).."\n**Passaporte:** "..parseFormat(OtherPassport).."\n**Serviços:** "..parseFormat(services).."\n**Multa:** $"..parseFormat(fines).."\n**Horário:** "..os.date("%H:%M:%S").."\n**Motivo:** "..text,13541152)
			end

			Actived[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local Preset = {
	["mp_m_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 145, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 25, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 395, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 83, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 152, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 25, texture = 0 },
		["tshirt"] = { item = 14, texture = 0 },
		["torso"] = { item = 418, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 86, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:PRISONCLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:prisonClothes")
AddEventHandler("police:prisonClothes",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		local mHash = vRP.ModelPlayer(entity[1])
		if mHash == "mp_m_freemode_01" or mHash == "mp_f_freemode_01" then
			TriggerClientEvent("skinshop:Apply",entity[1],Preset[mHash])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHUSER
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.searchUser(OtherPassport)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local OtherPassport = parseInt(OtherPassport)
		local Identity = vRP.Identity(OtherPassport)
		if Identity then
			local Fines = vRP.GetFine(OtherPassport)
			local Records = vRP.Query("prison/GetRecords",{ OtherPassport = parseInt(OtherPassport) })

			return { true,Identity["name"].." "..Identity["name2"],Identity["phone"],Fines,Records,Identity["gunlicense"] }
		end
	end

	return { false }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITFINE
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.initFine(OtherPassport,fines,text)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and fines > 0 then
		if Actived[Passport] == nil then
			Actived[Passport] = true

			TriggerEvent("Discord","Prison","**Por:** "..parseFormat(Passport).."\n**Passaporte:** "..parseFormat(OtherPassport).."\n**Multa:** $"..parseFormat(fines).."\n**Horário:** "..os.date("%H:%M:%S").."\n**Motivo:** "..text,2316674)
			TriggerClientEvent("Notify",source,"Sucesso","Multa aplicada.","verde",5000)
			TriggerClientEvent("police:Update",source,"reloadFine")
			vRP.GiveFine(OtherPassport,fines)

			if NewBank then
				exports["bank"]:AddFines(Passport,OtherPassport,fines,text)
			end

			Actived[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.updatePort(OtherPassport)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local portStatus = "Desativado"
		local OtherSource = vRP.Source(OtherPassport)
		local OtherPassport = parseInt(OtherPassport)
		local Identity = vRP.Identity(OtherPassport)

		if parseInt(Identity["gunlicense"]) == 0 then
			portStatus = "Ativado"
			vRP.UpgradePort(OtherPassport,OtherSource,1)
		else
			portStatus = "Desativado"
			vRP.UpgradePort(OtherPassport,OtherSource,0)
		end

		TriggerClientEvent("Notify",source,"Sucesso","Porte atualizado.","verde",5000)
		TriggerClientEvent("police:Update",source,"reloadSearch",parseInt(OtherPassport))
		TriggerEvent("Discord","Prison","**Por:** "..parseFormat(Passport).."\n**Passaporte:** "..parseFormat(OtherPassport).."\n**Porte:** "..portStatus.."\n**Horário:** "..os.date("%H:%M:%S"),3042892)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:REDUCES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Reduces")
AddEventHandler("police:Reduces",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Identity = vRP.Identity(Passport)
		if parseInt(Identity["prison"]) > 0 then
			if not Reduces[Number] then
				Reduces[Number] = {}
			end

			if Reduces[Number][Passport] then
				if os.time() > Reduces[Number][Passport] then
					reduceFunction(source,Passport,Number)
				else
					TriggerClientEvent("Notify",source,"Sistema Penitenciário","Nada encontrado.","default",5000)
				end
			else
				reduceFunction(source,Passport,Number)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISONITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local PrisonItens = {
	{ ["Item"] = "cigarette", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "cannedsoup", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "canofbeans", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "key", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "sulfuric", ["Min"] = 1, ["Max"] = 1 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REDUCEFUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
function reduceFunction(source,Passport,Number)
	vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)
	TriggerClientEvent("Progress",source,"Vasculhando",10000)
	Reduces[Number][Passport] = os.time() + 600
	Player(source)["state"]["Buttons"] = true
	Player(source)["state"]["Cancel"] = true
	local timeProgress = 10

	repeat
		Wait(1000)
		timeProgress = timeProgress - 1
	until timeProgress <= 0

	local Random = math.random(#PrisonItens)
	local Amount = math.random(PrisonItens[Random]["Min"],PrisonItens[Random]["Max"])
	vRP.GenerateItem(Passport,PrisonItens[Random]["Item"],Amount,true)

	vRP.UpdatePrison(Passport,source,math.random(2))
	Player(source)["state"]["Buttons"] = false
	Player(source)["state"]["Cancel"] = false
	vRPC.Destroy(source)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:ESCAPE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Escape")
AddEventHandler("police:Escape",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.TakeItem(Passport,"key",1,true) then
			vCLIENT.EscapePrison(source)
			TriggerEvent("markers:Remove",source)
		else
			TriggerClientEvent("Notify",source,"Sistema Penitenciário","Você precisa de <b>1x "..itemName("key").."</b>.","default",5000)
		end
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	local Identity = vRP.Identity(Passport)
	if parseInt(Identity["prison"]) > 0 then
		TriggerEvent("markers:Add",Passport,"Prisioneiro")
		TriggerClientEvent("Notify",source,"Sistema Penitenciário","Ainda restam <b>"..parseInt(Identity["prison"]).." serviços</b>.","azul",10000)
	end

	if Actived[Passport] == true then
		Actived[Passport] = nil
	end
end)