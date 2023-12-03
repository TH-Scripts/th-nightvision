ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('th-nightvision:menu', function()
    local playerPed = PlayerPedId()
    SetPedPropIndex(playerPed, 0, 117, 
    1, true)
    lib.registerContext({
        id = 'nightvision',
        title = 'Politi - Nightvision',
        onExit = function()
            animHelmetOff()
            Wait(800)
            clearPedProp()
            TriggerServerEvent('th-nightvision:giveHelmetBack')
        end,
        options = {
          {
            title = 'Nightvision',
            description = 'Tryk her for at indstille nightvision',
            icon = 'circle-up',
            onSelect = function()
                animHelmetFlipDown()
                Wait(500)
                SetNightvision(true)
                SetPedPropIndex(playerPed, 0, 116, 
                nil, true)
            end
          },
          {
            title = 'Thermalvision',
            description = 'Tryk her for at indstille thermalvision',
            icon = 'circle-down',
            onSelect = function()
                animHelmetFlipDown()
                Wait(500)
                SetSeethrough(true)
                SetPedPropIndex(playerPed, 0, 116, 
                nil, true)
            end
          }
        }
      })


    lib.showContext('nightvision')
end)

RegisterKeyMapping(Config.removeCommand, 'Fjern nightvision hjelm', 'keyboard', Config.defaultKeybind)

RegisterCommand(Config.removeCommand, function()
    local playerPed = PlayerPedId()
    ESX.TriggerServerCallback('th-nightvision:hasHelmet', function(hasHelmet)
        if not hasHelmet then
            animHelmetFlipUp()
            Wait(500)
            SetSeethrough(false)
            SetPedPropIndex(playerPed, 0, 117, 
            1, true)
            SetNightvision(false)
            animHelmetOff()
            Wait(800)
            TriggerServerEvent('th-nightvision:giveHelmetBack')
            clearPedProp()
        else
            animHelmetFlipUp()
            Wait(500)
            SetSeethrough(false)
            SetPedPropIndex(playerPed, 0, 117, 
            1, true)
            SetNightvision(false)
            animHelmetOff()
            Wait(800)
            clearPedProp()
        end
    end)
end)



exports('nightvision', function(data, slot)
    if ESX.PlayerData.job.name  == Config.allowedJobs then
        animHelmetOn()
        Wait(800)
        TriggerEvent('th-nightvision:menu')
        TriggerServerEvent('th-nightvision:removeHelmet')
    else
        lib.notify({
            id = 'police_fail',
            title = 'Politi - Udstyr',
            description = 'Du er ikke betjent!',
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                color = '#909296'
                }
            },
            icon = 'circle-xmark',
            iconColor = '#C53030'
        })
    end
end)