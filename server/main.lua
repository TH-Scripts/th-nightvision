ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('th-nightvision:giveHelmetBack', function()
    exports.ox_inventory:AddItem(1, 'nightvision', 1)
end)

RegisterNetEvent('th-nightvision:removeHelmet', function()
    exports.ox_inventory:RemoveItem(1, 'nightvision', 1)
end)

ESX.RegisterServerCallback('th-nightvision:hasHelmet', function(source, cb)
    local item = exports.ox_inventory:GetItem(source, 'nightvision')
	

    if item.count >= 1 then 
        cb(true)
    else
        cb(false)
    end 
end)