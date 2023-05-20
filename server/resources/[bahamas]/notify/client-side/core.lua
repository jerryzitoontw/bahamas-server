-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("notify")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Shortcuts = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
local ValidNotify = {
    ["vermelho"] = true,
    ["verde"] = true,
    ["amarelo"] = true,
    ["azul"] = true,
    ["sangramento"] = true,
    ["compras"] = true,
    ["fome"] = true,
    ["sede"] = true,
    ["police"] = true,
    ["paramedic"] = true,
    ["admin"] = true,
}

RegisterNetEvent("Notify")
AddEventHandler("Notify",function(Css,Message,Timer,Title)
    if not Title then
        Title = false
    end

    if ValidNotify[Css] then
        SendNUIMessage({ name = "Notify", payload = { Css, Message, Title, Timer or 5000 } })
    else
        SendNUIMessage({ name = "Notify", payload = { "vermelho", Message, Title, Timer or 5000 } })
    end
end)