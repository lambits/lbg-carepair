--What you want to say when someone repairs their vehicle
local repairMessage = "~b~Vehicle ~g~repaired~b~!"

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterCommand("repaircar", function()
    local playerPed = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)
    if playerVehicle ~= 0 and GetPedInVehicleSeat(playerVehicle, -1) == playerPed and IsVehicleDamaged(playerVehicle) == 1 then
        SetVehicleDirtLevel(playerVehicle, 0.0)
        SetVehicleEngineHealth(playerVehicle, 1000)
        SetVehicleEngineOn(playerVehicle, true, true)
        SetVehicleFixed(playerVehicle)
        ShowNotification(repairMessage)
    end
end)
RegisterKeyMapping("repaircar", "Repair Car", "keyboard", "r")