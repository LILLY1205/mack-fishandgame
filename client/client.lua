local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedNPCs = {}

-- NUI Progress Bar Helper
function StartProgress(label, duration, cb)
    local ped = PlayerPedId()
    SendNUIMessage({ action = 'showProgress', label = label, duration = duration })
    FreezeEntityPosition(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    Citizen.Wait(duration)
    FreezeEntityPosition(ped, false)
    SendNUIMessage({ action = 'hideProgress' })
    if cb then cb() end
end

--------------------------------------------------------------------------------
-- NPC SPAWNING HELPER
--------------------------------------------------------------------------------

function SpawnVendorNPC(model, coords, heading)
    RequestModel(model)
    local attempts = 0
    while not HasModelLoaded(model) and attempts < 100 do
        Citizen.Wait(50)
        attempts = attempts + 1
    end
    if not HasModelLoaded(model) then
        if Config.Debug then print('^1[ERROR] Failed to load model: ' .. model .. '^0') end
        return nil
    end
    local ped = CreatePed(model, coords.x, coords.y, coords.z - 1.0, heading, false, false, 0, 0)
    SetEntityAlpha(ped, 0, false)
    SetRandomOutfitVariation(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedRelationshipGroupHash(ped, GetPedRelationshipGroupHash(ped))
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(ped), `PLAYER`)
    for i = 0, 255, 51 do
        Citizen.Wait(50)
        SetEntityAlpha(ped, i, false)
    end
    SetEntityAsMissionEntity(ped, true, true)
    return ped
end

--------------------------------------------------------------------------------
-- NPC CLEANUP ON RESOURCE STOP
--------------------------------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k, v in pairs(spawnedNPCs) do
        if DoesEntityExist(v) then
            exports['ox_target']:removeLocalEntity(v)
            DeletePed(v)
        end
    end
    spawnedNPCs = {}
end)

--------------------------------------------------------------------------------
-- BLIPS (always visible, independent of NPC spawn state)
--------------------------------------------------------------------------------

Citizen.CreateThread(function()
    for _, v in pairs(Config.TrapperLocations) do
        if Config.ShowBlips and v.showblip == true then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(blip, GetHashKey(Config.TrapperBlip.blipSprite), true)
            SetBlipScale(blip, Config.TrapperBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.TrapperBlip.blipName)
        end
    end
    for _, v in pairs(Config.ButcherLocations) do
        if Config.ShowBlips and v.showblip == true then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(blip, GetHashKey(Config.ButcherBlip.blipSprite), true)
            SetBlipScale(blip, Config.ButcherBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.ButcherBlip.blipName)
        end
    end
    for _, v in pairs(Config.FishVendorLocations) do
        if Config.ShowBlips and v.showblip == true then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(blip, GetHashKey(Config.FishVendorBlip.blipSprite), true)
            SetBlipScale(blip, Config.FishVendorBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.FishVendorBlip.blipName)
        end
    end
end)

--------------------------------------------------------------------------------
-- DISTANCE-BASED NPC SPAWN MANAGEMENT (rsg-npcs style)
--------------------------------------------------------------------------------

local function GetVendorOptions(locationId, vendorType, vendorName)
    local label = 'open ' .. vendorName
    local event, name
    if vendorType == 'trapper' then
        name = 'fg-trapper-' .. locationId
    elseif vendorType == 'butcher' then
        name = 'fg-butcher-' .. locationId
    else
        name = 'fg-fish-' .. locationId
    end
    return {
        {
            name = name,
            label = label,
            icon = 'fas fa-hand',
            distance = 3.5,
            onSelect = function()
                TriggerEvent('mack-fishandgame:client:openVendor', vendorName, vendorType)
            end,
        },
    }
end

Citizen.CreateThread(function()
    local vendorList = {}
    for k, v in pairs(Config.TrapperLocations) do
        vendorList['trapper-' .. k] = { vendorType = 'trapper', name = v.name, location = v.location, coords = v.coords, model = v.model, heading = v.heading }
    end
    for k, v in pairs(Config.ButcherLocations) do
        vendorList['butcher-' .. k] = { vendorType = 'butcher', name = v.name, location = v.location, coords = v.coords, model = v.model, heading = v.heading }
    end
    for k, v in pairs(Config.FishVendorLocations) do
        vendorList['fish-' .. k] = { vendorType = 'fishvendor', name = v.name, location = v.location, coords = v.coords, model = v.model, heading = v.heading }
    end

    while true do
        Citizen.Wait(500)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for key, v in pairs(vendorList) do
            local dist = #(playerCoords - v.coords)
            if dist < Config.DistanceSpawn and not spawnedNPCs[key] then
                local ped = SpawnVendorNPC(v.model, v.coords, v.heading)
                if ped then
                    spawnedNPCs[key] = ped
                    local options = GetVendorOptions(v.location, v.vendorType, v.name)
                    exports['ox_target']:addLocalEntity(ped, options)
                end
            elseif dist >= Config.DistanceSpawn and spawnedNPCs[key] then
                local ped = spawnedNPCs[key]
                for i = 255, 0, -51 do
                    Citizen.Wait(50)
                    SetEntityAlpha(ped, i, false)
                end
                exports['ox_target']:removeLocalEntity(ped)
                DeletePed(ped)
                spawnedNPCs[key] = nil
            end
        end
    end
end)

--------------------------------------------------------------------------------
-- OPEN VENDOR NUI
--------------------------------------------------------------------------------
RegisterNetEvent('mack-fishandgame:client:openVendor', function(vendorName, vendorType)
    local sellOptions = {}
    local shopItems = {}

    if vendorType == 'trapper' then
        sellOptions = {
            { id = 'sellPelts', label = Lang:t('menu.sell_stored_pelts'), desc = '$' .. Config.PoorPeltPrice .. '-$' .. Config.LegendaryPeltPrice .. ' each' },
            { id = 'sellCarcass', label = Lang:t('menu.sell_stored_carcass'), desc = '$' .. Config.PoorCarcassPrice .. '-$' .. Config.LegendaryCarcassPrice .. ' each' },
            { id = 'sellFeathers', label = Lang:t('menu.sell_stored_feathers'), desc = '$' .. Config.FeathersPrice .. ' each' },
        }
        for k, v in pairs(Config.TrapperShop) do
            table.insert(shopItems, { name = v.name, label = RSGCore.Shared.Items[v.name] and RSGCore.Shared.Items[v.name].label or v.name, price = v.price, stock = v.amount, type = v.type })
        end
    elseif vendorType == 'butcher' then
        sellOptions = {
            { id = 'sellAnimal', label = Lang:t('menu.sell_animal'), desc = '$' .. Config.ButcherPoorMultiplier .. '-$' .. Config.ButcherPerfectMultiplier .. ' multiplier' },
        }
        for k, v in pairs(Config.ButcherShop) do
            table.insert(shopItems, { name = v.name, label = RSGCore.Shared.Items[v.name] and RSGCore.Shared.Items[v.name].label or v.name, price = v.price, stock = v.amount, type = v.type })
        end
    elseif vendorType == 'fishvendor' then
        sellOptions = {
            { id = 'sellSmallFish', label = Lang:t('menu.sell_small_fish'), desc = '$' .. Config.SmallFishPrice .. ' each' },
            { id = 'sellMediumFish', label = Lang:t('menu.sell_medium_fish'), desc = '$' .. Config.MediumFishPrice .. ' each' },
            { id = 'sellLargeFish', label = Lang:t('menu.sell_large_fish'), desc = '$' .. Config.LargeFishPrice .. ' each' },
        }
        for k, v in pairs(Config.FishVendorShop) do
            table.insert(shopItems, { name = v.name, label = RSGCore.Shared.Items[v.name] and RSGCore.Shared.Items[v.name].label or v.name, price = v.price, stock = v.amount, type = 'item' })
        end
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openVendor',
        vendorType = vendorType,
        name = vendorName,
        sellOptions = sellOptions,
        shopItems = shopItems,
        lang = {
            menu = {
                price = Lang:t('menu.price'),
                instock = Lang:t('menu.instock'),
                buy = Lang:t('menu.buy'),
                quantity = Lang:t('menu.quantity'),
                select_item = Lang:t('menu.select_item'),
            }
        }
    })
end)

--------------------------------------------------------------------------------
-- NUI CALLBACKS
--------------------------------------------------------------------------------

RegisterNUICallback('sellAction', function(data, cb)
    cb('ok')
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeVendor' })

    local actionType = data.type

    if actionType == 'sellPelts' then
        TriggerEvent('mack-fishandgame:client:progressSellPelts')
    elseif actionType == 'sellCarcass' then
        TriggerEvent('mack-fishandgame:client:progressSellCarcass')
    elseif actionType == 'sellFeathers' then
        TriggerEvent('mack-fishandgame:client:progressSellFeathers')
    elseif actionType == 'sellAnimal' then
        TriggerEvent('mack-fishandgame:client:checkSellAnimal')
    elseif actionType == 'sellSmallFish' then
        TriggerEvent('mack-fishandgame:client:progressSellSmallFish')
    elseif actionType == 'sellMediumFish' then
        TriggerEvent('mack-fishandgame:client:progressSellMediumFish')
    elseif actionType == 'sellLargeFish' then
        TriggerEvent('mack-fishandgame:client:progressSellLargeFish')
    end
end)

RegisterNUICallback('buyItem', function(data, cb)
    cb(json.encode({ success = true }))
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeVendor' })
    TriggerEvent('mack-fishandgame:client:progressBuyItem', data)
end)

RegisterNUICallback('closeVendor', function(data, cb)
    cb('ok')
    SetNuiFocus(false, false)
end)

--------------------------------------------------------------------------------
-- TRAPPER SELL PROGRESS BARS
--------------------------------------------------------------------------------

RegisterNetEvent('mack-fishandgame:client:progressSellPelts', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.checking_pelts'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellPelts')
                TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
                TriggerServerEvent('ak4y-battlepass:taskCountAdd:standart', 7, 1)
                TriggerServerEvent('ak4y-battlepass:taskCountAdd:premium', 4, 1)
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.you_dont_have_any_pelts_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'pelts')
end)

RegisterNetEvent('mack-fishandgame:client:progressSellCarcass', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.checking_carcass'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellCarcass')
                TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.you_dont_have_any_carcass_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'carcass')
end)

RegisterNetEvent('mack-fishandgame:client:progressSellFeathers', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.checking_feathers'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellFeathers')
                TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.you_dont_have_any_feathers_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'feathers')
end)

--------------------------------------------------------------------------------
-- FISH VENDOR SELL PROGRESS BARS
--------------------------------------------------------------------------------

RegisterNetEvent('mack-fishandgame:client:progressSellSmallFish', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.selling_fish'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellSmallFish')
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.no_small_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'smallfish')
end)

RegisterNetEvent('mack-fishandgame:client:progressSellMediumFish', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.selling_fish'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellMediumFish')
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.no_medium_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'mediumfish')
end)

RegisterNetEvent('mack-fishandgame:client:progressSellLargeFish', function()
    RSGCore.Functions.TriggerCallback('mack-fishandgame:server:checkItems', function(hasItems)
        if hasItems then
            StartProgress(Lang:t('progressbar.selling_fish'), Config.SellTime, function()
                TriggerServerEvent('mack-fishandgame:server:sellLargeFish')
            end)
        else
            TriggerEvent('bln_notify:send', { title = Lang:t('error.no_large_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end, 'largefish')
end)

--------------------------------------------------------------------------------
-- BUY ITEM PROGRESS BAR
--------------------------------------------------------------------------------

RegisterNetEvent('mack-fishandgame:client:progressBuyItem', function(data)
    TriggerServerEvent('mack-fishandgame:server:buyItem', data)
end)

--------------------------------------------------------------------------------
-- BUTCHER SELL ANIMAL (carried animal check)
--------------------------------------------------------------------------------

RegisterNetEvent('mack-fishandgame:client:checkSellAnimal', function()
    local ped = PlayerPedId()
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
    local model = GetEntityModel(holding)
    local quality = Citizen.InvokeNative(0x7BCC6087D130312A, holding)
    if Config.Debug then
        print("model: " .. tostring(model))
        print("quality: " .. tostring(quality))
    end
    if holding ~= false then
        for i = 1, #Config.ButcherAnimals do
            if model == Config.ButcherAnimals[i].model then
                local rewardmoney = Config.ButcherAnimals[i].rewardmoney
                local rewarditem = Config.ButcherAnimals[i].rewarditem
                local name = Config.ButcherAnimals[i].name
                if Config.Debug then
                    print("reward money: " .. tostring(rewardmoney))
                    print("reward item: " .. tostring(rewarditem))
                    print("name: " .. tostring(name))
                end
                StartProgress(Lang:t('progressbar.selling') .. name .. '..', Config.SellTime, function()
                    local deleted = DeleteThisEntity(holding)
                    if deleted then
                        local qualityStr = 'poor'
                        if quality == false or quality == 0 then
                            qualityStr = 'poor'
                        elseif quality == 1 then
                            qualityStr = 'good'
                        elseif quality == 2 or quality == -1 then
                            qualityStr = 'perfect'
                        end
                        TriggerServerEvent('mack-fishandgame:server:reward', rewardmoney, rewarditem, qualityStr)
                        TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
                    else
                        TriggerEvent('bln_notify:send', { title = Lang:t('error.something_went_wrong'), icon = 'cross', duration = 5000 }, 'ERROR')
                    end
                end)
                return
            end
        end
    else
        TriggerEvent('bln_notify:send', { title = Lang:t('error.dont_have_animal'), icon = 'cross', duration = 5000 }, 'ERROR')
    end
end)

function DeleteThisEntity(holding)
    NetworkRequestControlOfEntity(holding)
    SetEntityAsMissionEntity(holding, true, true)
    Wait(100)
    DeleteEntity(holding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingcheck = GetPedType(entitycheck)
    if holdingcheck == 0 then
        return true
    else
        return false
    end
end

--------------------------------------------------------------------------------
-- TRAPPER PICKUP THREAD (auto-store pelt on pickup)
--------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
        local pelthash = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
        if Config.Debug then
            print("holding: " .. tostring(holding))
            print("pelthash: " .. tostring(pelthash))
        end
        if holding ~= false then
            for i = 1, #Config.Pelts do
                if pelthash == Config.Pelts[i].pelthash then
                    local name = Config.Pelts[i].name
                    local rewarditem1 = Config.Pelts[i].rewarditem1
                    local rewarditem2 = Config.Pelts[i].rewarditem2
                    local rewarditem3 = Config.Pelts[i].rewarditem3
                    local rewarditem4 = Config.Pelts[i].rewarditem4
                    local rewarditem5 = Config.Pelts[i].rewarditem5

                    local deleted = DeleteThisEntity(holding)
                    if deleted then
                        TriggerEvent('bln_notify:send', { title = name .. Lang:t('primary.stored'), icon = 'tick', duration = 3000, placement = 'middle-left' })
                        TriggerServerEvent('mack-fishandgame:server:storePelt', rewarditem1)
                        TriggerServerEvent('mack-fishandgame:server:storeCarcass', rewarditem2, rewarditem3, rewarditem4, rewarditem5)
                        TriggerServerEvent('ak4y-battlepass:taskCountAdd:standart', 8, 1)
                        TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
                    else
                        TriggerEvent('bln_notify:send', { title = Lang:t('error.something_went_wrong'), icon = 'cross', duration = 5000 }, 'ERROR')
                    end
                end
            end
        end
    end
end)

-- Gather event detection for animals
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for index = 0, size - 1 do
                local event = GetEventAtIndex(0, index)
                if event == 1376140891 then
                    local view = exports["mack-fishandgame"]:DataViewNativeGetEventData(0, index, 3)
                    local pedGathered = view['2']
                    local ped = view['0']
                    local model = GetEntityModel(pedGathered)
                    local bool_unk = view['4']
                    local player = PlayerPedId()
                    local playergate = player == ped

                    if model and playergate == true and Config.Debug then
                        print('Animal Gathered: ' .. model)
                    end

                    for i = 1, #Config.TrapperAnimals do
                        if model and Config.TrapperAnimals[i].modelhash ~= nil and playergate and bool_unk == 1 then
                            if model == Config.TrapperAnimals[i].modelhash then
                                local rewarditem2 = Config.TrapperAnimals[i].rewarditem2
                                local rewarditem3 = Config.TrapperAnimals[i].rewarditem3
                                local rewarditem4 = Config.TrapperAnimals[i].rewarditem4
                                local rewarditem5 = Config.TrapperAnimals[i].rewarditem5
                                TriggerServerEvent('mack-fishandgame:server:storeCarcass', rewarditem2, rewarditem3, rewarditem4, rewarditem5)
                                TriggerServerEvent('j-reputations:server:addrep', 'hunting', 1)
                            end
                        end
                    end
                end
            end
        end
    end
end)

--------------------------------------------------------------------------------
-- DEBUG: spawn animal command
--------------------------------------------------------------------------------
RegisterCommand('spawn_animal', function(source, args, rawCommand)
    local animal = args[1] or 'mp_a_c_wolf_01'
    local outfit = args[2] or 0
    local wait = tonumber(args[3]) or 10000
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    if Config.Debug then
        RequestModel(animal)
        while not HasModelLoaded(animal) do
            Wait(10)
        end
        animal = CreatePed(animal, playerCoords.x, playerCoords.y + 5, playerCoords.z, true, true, true)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, animal, outfit, false)
        Wait(wait)
        FreezeEntityPosition(animal, true)
    end
end, false)
