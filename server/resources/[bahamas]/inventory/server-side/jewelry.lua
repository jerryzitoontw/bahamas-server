-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local jewelryShowcase = {}
local jewelryTimers = os.time()
local jewelryCooldowns = os.time()
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.startJewelry()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if os.time() >= jewelryCooldowns then
			local Service = vRP.NumPermission("Police")
			if parseInt(#Service) <= 10 then
				local Consult = vRP.InventoryItemAmount(Passport,"pendrive")
				if Consult[1] <= 0 then
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x Pendrive</b>.","Aviso",5000)
					return false
				end

				if vRP.CheckDamaged(Consult[2]) then
					TriggerClientEvent("Notify",source,"vermelho","<b>Pendrive</b> quebrado.","Aviso",5000)
					return false
				end

				if vRP.TakeItem(Passport,Consult[2],1) then
					TriggerClientEvent("Notify",source,"verde","Sistema corrompido.","Sucesso",5000)
					jewelryCooldowns = os.time() + 7200
					jewelryTimers = os.time() + 600
					jewelryShowcase = {}

					for k,v in pairs(Service) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ code = "QRU", title = "Joalheria", x = -633.07, y = -238.7, z = 38.06, criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 22 })
							vRPC.PlaySound(Sources,"Beep_Green","DLC_HEIST_HACKING_SNAKE_SOUNDS")
						end)
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Sistema indisponível no momento.","Aviso",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Sistema indisponível no momento.","Aviso",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:SHOWCASE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Showcase")
AddEventHandler("inventory:Showcase",function(Entity)
	local source = source
	local Showcase = Entity[1]
	local Passport = vRP.Passport(source)
	if Passport then
		if os.time() <= jewelryTimers then
			if jewelryShowcase[Showcase] == nil then
				jewelryShowcase[Showcase] = true
			    Player(source)["state"]["Buttons"] = true
			    Player(source)["state"]["Cancel"] = true
				vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)
				TriggerClientEvent("Progress",source,"Roubando",20000)

				SetTimeout(20000,function()
					vRPC.Destroy(source,false)
					vRP.UpgradeStress(Passport,1)
					TriggerEvent("Wanted",source,Passport,30)
					Player(source)["state"]["Buttons"] = false
					Player(source)["state"]["Cancel"] = false
					vRP.GenerateItem(Passport,"watch",math.random(20,30),true)
				end)
			else
				TriggerClientEvent("Notify",source,"azul","Vitrine vazia.","Aviso",3000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Necessário corromper o sistema.","Aviso",3000)
		end
	end
end)