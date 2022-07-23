QBCore = nil
local QBCore = exports['sp-core']:GetCoreObject()

RegisterServerEvent('sp-kartingjob:giveitem')
AddEventHandler('sp-kartingjob:giveitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) 
        player.Functions.AddItem(item, count)
    end
end)

RegisterServerEvent('sp-kartingjob:deleteitem')
AddEventHandler('sp-kartingjob:deleteitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        if player.Functions.GetItemByName(item) ~= nil then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1) 
            player.Functions.RemoveItem(item, count)
        else
            TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
        end
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem1', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Humburger Buns!", "error")
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem2', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Cheese!", "error")
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem3', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Lettuce!", "error")
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem4', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Cooked Patty!", "error")
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem5', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Potato!", "error")
    end
end)

QBCore.Functions.CreateCallback('sp-kartingjob:checkitem6', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing Patty!", "error")
    end
end)

QBCore.Commands.Add("fixkarting", "Fix Command For Karting Workers", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "karting" then
        TriggerClientEvent("karting:fix", source)
    else
        TriggerClientEvent('chat:addMessage', source, {
        template = '<div class="chat-message emergency">This command is for Karting Workers!  </div>',
        })
    end
end)