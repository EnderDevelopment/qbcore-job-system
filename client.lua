local QBCore = exports['qb-core']:GetCoreObject()

local function CreateBlip(job)
    local blip = AddBlipForCoord(job.locations[1].x, job.locations[1].y, job.locations[1].z)
    SetBlipSprite(blip, job.blip.sprite)
    SetBlipColour(blip, job.blip.color)
    SetBlipScale(blip, job.blip.scale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(job.label)
    EndTextCommandSetBlipName(blip)
    return blip
end

local function StartJob()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == 'jengi' then
        for _, job in pairs(Config.Jobs) do
            CreateBlip(job)
        end
        QBCore.Functions.Notify('Job started!', 'success')
    else
        QBCore.Functions.Notify('You are not a Jengi!', 'error')
    end
end

RegisterNetEvent('qb-jengijob:startJob', StartJob)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then
            TriggerServerEvent('qb-jengijob:startJob')
        end
    end
end)