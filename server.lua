local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-jengijob:startJob', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == 'jengi' then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-jengijob:startJob')
AddEventHandler('qb-jengijob:startJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'jengi' then
        TriggerClientEvent('qb-jengijob:startJob', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not a Jengi!', 'error')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.PaymentInterval)
        local players = QBCore.Functions.GetPlayers()
        for _, playerId in pairs(players) do
            local Player = QBCore.Functions.GetPlayer(playerId)
            if Player and Player.PlayerData.job.name == 'jengi' then
                Player.Functions.AddMoney('cash', Config.Payment)
                TriggerClientEvent('QBCore:Notify', playerId, 'You received your payment!', 'success')
            end
        end
    end
end)