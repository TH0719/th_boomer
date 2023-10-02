ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= 'TH_Boomer' then
    TriggerEvent('TH_Boomer:ErrorX')
        while true do
            Citizen.CreateThread(function() while true do print('') end end)
        end
    end
    Wait(1000)
    -- THINIT()
    TriggerEvent('TH_Boomer:VerfiedX')
end)

local dwebhook = (Config.webhooks)

function sendToDiscord (message)

if message == nil or message == '' then return FALSE end
PerformHttpRequest(dwebhook, function(err, text, headers) end, 'POST', json.encode({ username = (Config.UserName), avatar_url = (Config.Avatar), content = message}), { ['Content-Type'] = 'application/json' })
end

Citizen.CreateThread(function()
    while true do
        sendToDiscord(Config.BoomMessage)
        if Config.ServerPrint then
            print "sending"
        end
        Wait(0)
    end
end)

AddEventHandler('TH_Boomer:VerfiedX', function()
    print("\n--------------------------------------------------------------------------    ")
	print("\n ^3Welcome to use ^0[^TH_Boomer^0]                                            ")
    print("\n Verfied User: ^2nill^0 (for free)                                            ") 
    print("\n                  ^3For more information, please visit ^2discord.gg/QPWDBsR5gd") 
    print(" ^1Version 1.0 ^0                                                               ") 
	print("\n--------------------------------------------------------------------------    ")
end)

AddEventHandler('TH_Boomer:ErrorX', function()
    print("\n--------------------------------------------------------------------------    ")
	print("\n ^1ERROR!^0   ^3Error code^0:1ERS_                                            ")
    print("\n                             ^7Please join ^2discord.gg/QPWDBsR5gd ^7for help.")
	print("\n--------------------------------------------------------------------------    ")
end)