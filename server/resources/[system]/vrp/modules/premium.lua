-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetPremium(source)
    if Characters[source] then
        vRP.Query("accounts/setPremium", { license = Characters[source].license, premium = os.time() + 2592000 })
        Characters[source].premium = parseInt(os.time() + 2592000)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEPREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradePremium(source)
    if Characters[source] then
        vRP.Query("accounts/updatePremium", { license = Characters[source].license })
        Characters[source].premium = Characters[source].premium + 2592000
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERPREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserPremium(Passport)
    local Source =  vRP.Source(Passport)
    local HasPermission = vRP.HasPermission(Passport, "Premium")
    if Characters[Source] then
        if Characters[Source].premium < os.time() then
            if HasPermission then
                vRP.RemovePermission(Passport, "Premium")
            end
        elseif not HasPermission then
            vRP.SetPermission(Passport, "Premium")
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LICENSEPREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.LicensePremium(License)
    local Account = vRP.Account(License)
    if Account and Account.premium >= os.time() then
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)