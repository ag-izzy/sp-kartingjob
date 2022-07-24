QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("sp-kartingjob:SpawnKarting20", function() 
local coords = vector4(-164.5816, -2135.381, 16.00028, 291.14218)
QBCore.Functions.SpawnVehicle('Kart20', function(veh)
QBCore.Functions.Notify('Kart 1 Spawn', 'success', 5000)
    SetVehicleNumberPlateText(veh, 'TEST')
    SetEntityHeading(veh, coords.w)
    exports['LegacyFuel']:SetFuel(veh, 100.0)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end)

RegisterNetEvent("sp-kartingjob:SpawnKarting3", function() 
    local coords = vector4(-163.1586, -2138.765, 16.002014, 292.40936)
    QBCore.Functions.SpawnVehicle('Kart3', function(veh)
    QBCore.Functions.Notify('Kart 2 Spawn', 'success', 5000)
        SetVehicleNumberPlateText(veh, 'TEST')
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    end)

RegisterNetEvent("sp-kartingjob:SpawnKarting4", function() 
    local coords = vector4(-161.9623, -2142.239, 15.999867, 290.61102)
    QBCore.Functions.SpawnVehicle('kart', function(veh)
    QBCore.Functions.Notify('Kart 3 Spawn', 'success', 5000)  
        SetVehicleNumberPlateText(veh, 'TEST')
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    end)    
   
RegisterNetEvent("sp-kartingjob:SpawnKarting5", function() 
    local coords = vector4(-160.7415, -2145.591, 15.999864, 291.24438)
    QBCore.Functions.SpawnVehicle('Shifter_kart', function(veh)
    QBCore.Functions.Notify('Kart 4 Spawn', 'success', 5000)
        SetVehicleNumberPlateText(veh, 'TEST')
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    end)        

RegisterNetEvent("sp-kartingjob:SpawnKarting6", function() 
    local coords = vector4(-165.5061, -2132.041, 15.999854, 291.15582)
    QBCore.Functions.SpawnVehicle('superkart', function(veh)
    QBCore.Functions.Notify('Kart 5 Spawn', 'success', 5000)
        SetVehicleNumberPlateText(veh, 'TEST')
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    end)
RegisterNetEvent("sp-kartingjob:DeleteKarting", function() 
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    if veh ~= 0 then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify('Karting Stored', 'success', 5000)   
    else
        QBCore.Functions.Notify("You Are Not In Vehicle", "error")
        local pcoords = GetEntityCoords(ped)
        local vehicles = GetGamePool('CVehicle')
        for k, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                QBCore.Functions.DeleteVehicle(v)
            end
        end
    end
end)

function MakeHumburger()
    QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem4', function(hasItem)
        QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem3', function(hasItem)
            QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem2', function(hasItem)
                QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem1', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("Humburger", "Cooking Humburger", 5000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('sp-kartingjob:deleteitem', 'humburgerbuns', 1)
                                TriggerServerEvent('sp-kartingjob:deleteitem', 'cheese', 1)
                                TriggerServerEvent('sp-kartingjob:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('sp-kartingjob:deleteitem', 'cookedpatty', 1)
                                TriggerServerEvent('sp-kartingjob:giveitem',   'burger-heartstopper', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
                end, 'humburgerbuns')
            end, 'cheese')
        end, 'lettuce')
    end, 'cookedpatty')
end

RegisterNetEvent("sp-kartingjob:Humburger", function()
MakeHumburger()
end)

function MakeFries()
    QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem5', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("fries", "Making Fries", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('sp-kartingjob:deleteitem', 'potato', 1)
                    TriggerServerEvent('sp-kartingjob:giveitem', 'burger-fries', 1)
                else
                end
            end)
        end
    end, 'potato')
end

RegisterNetEvent("sp-kartingjob:Fries", function()
MakeFries()
end)

function MakeSoftDrink()
    QBCore.Functions.Progressbar("softdrink", "Dispensing Soft Drink", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49,
    }, {}, {}, function(cancelled) 
        if not cancelled then
            TriggerServerEvent('sp-kartingjob:giveitem', 'burger-softdrink', 1)
        else
            -- Do Something If Action Was Cancelled
        end
    end)
end

RegisterNetEvent("sp-kartingjob:SoftDrink", function()
    MakeSoftDrink()
    end)

function CookPatty()
    QBCore.Functions.TriggerCallback('sp-kartingjob:checkitem6', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("fries", "Cooking Patty", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "amb@prop_human_bbq@male@base",
                anim = "base",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('sp-kartingjob:deleteitem', 'patty', 1)
                    TriggerServerEvent('sp-kartingjob:giveitem', 'cookedpatty', 1)
                else
                end
            end)
        end
    end, 'patty')
end

RegisterNetEvent("sp-kartingjob:CookPatty", function()
    CookPatty()
end)

RegisterNetEvent('sp-kartingjob:FoodMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Food Menu",
            txt = "",
        },
        {
			id = 2,
            header = "Use The Ingredients To Cook Food",
            txt = "You Can Buy The Ingredients From The Shop",
			params = {
                event = "sp-kartingjob:CookFood"
            }
        },
        {
			id = 3,
            header = "Browse Shop",
            txt = "Buy Ingredients For The Food",
			params = {
                event = "sp-kartingjob:shop"
            }
        },
		{
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('sp-kartingjob:CookFood', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Food Cook Menu",
            txt = "",
        },
        {
			id = 2,
            header = "Cook Patty",
            txt = "1 Patty | 5 Seconds ",
			params = {
                event = "sp-kartingjob:CookPatty"
            }
        },
        {
			id = 3,
            header = "Hamburger",
            txt = "1 Cooked Patty | 1 Hamburger Buns | 1 Cheese | 1 Lettuce | 5 Seconds ",
			params = {
                event = "sp-kartingjob:Humburger"
            }
        },
        {
			id = 4,
            header = "Fries",
            txt = "1 Potato | 5 Seconds ",
			params = {
                event = "sp-kartingjob:Fries"
            }
        },
        {
			id = 5,
            header = "Soft Drink",
            txt = "None | 5 Seconds ",
			params = {
                event = "sp-kartingjob:SoftDrink"
            }
        },
        {
			id = 6,
            header = "Back ->", 
            txt = "Back To The Main Menu",
            params = {
                event = "sp-kartingjob:FoodMenu"
            }
        },
		{
			id = 7,
            header = "Close", 
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('sp-kartingjob:VehicleMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Karting Garage",
            txt = "",
			params = {
                event = "sp-kartingjob:Garage"
            }
        },
        {
			id = 2,
            header = "Store Karting",
            txt = "",
			params = {
                event = "sp-kartingjob:DeleteKarting"
            }
        },
		{
			id = 3,
            header = "Close", 
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('sp-kartingjob:Garage', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Karting Garage",
            txt = ""
        },
        {
			id = 2,
            header = "Kart 1",
            txt = "",
			params = {
                event = "sp-kartingjob:SpawnKarting20"
            }
        },
        {
			id = 3,
            header = "Kart 2",
            txt = "",
			params = {
                event = "sp-kartingjob:SpawnKarting3"
            }
        },
        {
			id = 4,
            header = "Kart 3",
            txt = "",
			params = {
                event = "sp-kartingjob:SpawnKarting4"
            }
        },
        {
			id = 5,
            header = "Kart 4",
            txt = "",
			params = {
                event = "sp-kartingjob:SpawnKarting5"
            }
        },
        {
			id = 5,
            header = "Kart 5",
            txt = "",
			params = {
                event = "sp-kartingjob:SpawnKarting6"
            }
        },
        {
			id = 6,
            header = "Back ->", 
            txt = "Back To The Main Menu",
            params = {
                event = "sp-kartingjob:VehicleMenu"
            }
        },
		{
			id = 7,
            header = "Close", 
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("sp-kartingjob:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "karting", Config.Items)
end)

exports['qb-target']:AddBoxZone("Karting Garage", vector3(-163.33, -2129.61, 16.7), 1.6, 0.2, {
	name = "Karting Garage",
    heading=290,
	debugPoly = false,
    minZ=14.7,
    maxZ=18.7
}, {
	options = {
		{
            type = "client",
            event = "sp-kartingjob:VehicleMenu",
			icon = "fa fa-car",
			label = "Open Karting Garage",
			job = "karting",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("Karting Food", vector3(-153.36, -2124.67, 16.71), 1.0, 2.2, {
	name = "Karting Food",
    heading=348,
	debugPoly = false,
    minZ=16.41,
    maxZ=18.01
}, {
	options = {
		{
            type = "client",
            event = "sp-kartingjob:FoodMenu",
			icon = "fas fa-utensils",
			label = "Open Karting Food Station",
			job = "karting",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("ToggleDuty", vector3(-156.2, -2126.43, 16.71), 1.8, 1.2, {
	name = "Toggle Duty",
	heading = 15.0,
	debugPoly = false,
    minZ=16.16,
    maxZ=16.76,
}, {
	options = {
		{
            type = "client",
            event = "qb-policejob:ToggleDuty",
			icon = "fas fa-clipboard",
			label = "Toggle Duty",
			job = "karting",
		},
	},
	distance = 2.5
})

RegisterNetEvent('karting:fix')

AddEventHandler('karting:fix',function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
        GetVehicleFuelLevel(vehicle)
		SetVehicleFixed(vehicle)
        QBCore.Functions.Notify('Car Fixed', 'success', 5000)
	else
        QBCore.Functions.Notify('You Are Not In Vehicle', 'error', 5000)
	end
end)
