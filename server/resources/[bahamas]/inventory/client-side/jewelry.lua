-----------------------------------------------------------------------------------------------------------------------------------------
-- MEMORY:TASKJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("memory:taskJewelry")
AddEventHandler("memory:taskJewelry",function()
	exports["memory"]:StartMinigame({ success = "inventory:startJewelry", fail = nil })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:STARTJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:startJewelry")
AddEventHandler("inventory:startJewelry",function()
	vSERVER.startJewelry()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	exports["target"]:AddCircleZone("jewelryHacker",vec3(-631.38,-230.24,38.05),0.75,{
        name = "jewelryHacker",
        heading = 3374176
    },{
        Distance = 0.75,
        options = {
            {
                event = "memory:taskJewelry",
                label = "Hackear",
                tunnel = "client"
            }
        }
    })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	exports["target"]:AddTargetModel({ 37228785,1768229041,-1880169779,-1846370968,1870138714 },{
        options = {
            {
                event = "inventory:Showcase",
                label = "Roubar",
                tunnel = "server"
            }
        },
        Distance = 0.75
	})
end)