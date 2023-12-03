local playerPed = PlayerPedId()

function clearPedProp()
    ClearPedProp(playerPed, 0)
end

function animHelmetFlipUp()
    local dict = "anim@mp_helmets@on_foot"
    local upAnim = "goggles_up"
    LoadAnim(dict)
    TaskPlayAnim(playerPed, dict, upAnim, 8.0, 8.0, 800, 1, 1, 0, 0, 0)
end

function animHelmetFlipDown()
    local dict = "anim@mp_helmets@on_foot"
    local upAnim = "goggles_down"
    LoadAnim(dict)
    TaskPlayAnim(playerPed, dict, upAnim, 8.0, 8.0, 800, 1, 1, 0, 0, 0)
end


function animHelmetOn()
    local dict = "veh@common@fp_helmet@"
    local upAnim = "put_on_helmet"
    LoadAnim(dict)
    TaskPlayAnim(playerPed, dict, upAnim, 8.0, 8.0, 1500, 1, 1, 0, 0, 0)
end

function animHelmetOff()
    local dict = "veh@common@fp_helmet@"
    local upAnim = "take_off_helmet_stand"
    LoadAnim(dict)
    TaskPlayAnim(playerPed, dict, upAnim, 8.0, 8.0, 1500, 1, 1, 0, 0, 0)
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end