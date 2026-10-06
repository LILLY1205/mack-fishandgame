local RSGCore = exports['rsg-core']:GetCoreObject()

--------------------------------------------------------------------------------
-- CHECK ITEMS CALLBACK (pre-progress bar check)
--------------------------------------------------------------------------------
RSGCore.Functions.CreateCallback('mack-fishandgame:server:checkItems', function(source, cb, category)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then cb(false) return end

    if category == 'pelts' then
        for i = 1, #Config.Pelts do
            local item = Player.Functions.GetItemByName(Config.Pelts[i].rewarditem1)
            if item and item.amount > 0 then cb(true) return end
        end
        cb(false)
    elseif category == 'carcass' then
        for i = 1, #Config.Carcass do
            local item = Player.Functions.GetItemByName(Config.Carcass[i])
            if item and item.amount > 0 then cb(true) return end
        end
        cb(false)
    elseif category == 'feathers' then
        local item = Player.Functions.GetItemByName('feathers')
        cb(item ~= nil and item.amount > 0)
    elseif category == 'smallfish' then
        local fish = {"a_c_fishbluegil_01_sm","a_c_fishbullheadcat_01_sm","a_c_fishchainpickerel_01_sm","a_c_fishperch_01_sm","a_c_fishredfinpickerel_01_sm","a_c_fishrockbass_01_sm"}
        for i = 1, #fish do
            local item = Player.Functions.GetItemByName(fish[i])
            if item and item.amount > 0 then cb(true) return end
        end
        cb(false)
    elseif category == 'mediumfish' then
        local fish = {"a_c_fishbluegil_01_ms","a_c_fishbullheadcat_01_ms","a_c_fishchainpickerel_01_ms","a_c_fishlargemouthbass_01_ms","a_c_fishperch_01_ms","a_c_fishrainbowtrout_01_ms","a_c_fishredfinpickerel_01_ms","a_c_fishrockbass_01_ms","a_c_fishsalmonsockeye_01_ml","a_c_fishsalmonsockeye_01_ms","a_c_fishsmallmouthbass_01_ms"}
        for i = 1, #fish do
            local item = Player.Functions.GetItemByName(fish[i])
            if item and item.amount > 0 then cb(true) return end
        end
        cb(false)
    elseif category == 'largefish' then
        local fish = {"a_c_fishchannelcatfish_01_lg","a_c_fishchannelcatfish_01_xl","a_c_fishlakesturgeon_01_lg","a_c_fishlargemouthbass_01_lg","a_c_fishlongnosegar_01_lg","a_c_fishmuskie_01_lg","a_c_fishnorthernpike_01_lg","a_c_fishrainbowtrout_01_lg","a_c_fishsalmonsockeye_01_lg","a_c_fishsmallmouthbass_01_lg"}
        for i = 1, #fish do
            local item = Player.Functions.GetItemByName(fish[i])
            if item and item.amount > 0 then cb(true) return end
        end
        cb(false)
    else
        cb(false)
    end
end)

--------------------------------------------------------------------------------
-- STORE PELT (on pickup)
--------------------------------------------------------------------------------
RegisterNetEvent('mack-fishandgame:server:storePelt')
AddEventHandler('mack-fishandgame:server:storePelt', function(rewarditem1)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.AddItem(rewarditem1, 1)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem1], "add")
end)

--------------------------------------------------------------------------------
-- STORE CARCASS (on pickup / gather)
--------------------------------------------------------------------------------
RegisterNetEvent('mack-fishandgame:server:storeCarcass')
AddEventHandler('mack-fishandgame:server:storeCarcass', function(rewarditem2, rewarditem3, rewarditem4, rewarditem5)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local chance2 = math.random(1, 100)
    local chance3 = math.random(1, 100)
    local chance4 = math.random(1, 100)
    local chance5 = math.random(1, 100)

    if rewarditem2 ~= nil and chance2 > 50 then
        Player.Functions.AddItem(rewarditem2, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem2], "add")
    end
    if rewarditem3 ~= nil and chance3 > 50 then
        Player.Functions.AddItem(rewarditem3, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem3], "add")
    end
    if rewarditem4 ~= nil and chance4 > 50 then
        Player.Functions.AddItem(rewarditem4, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem4], "add")
    end
    if rewarditem5 ~= nil and chance5 > 50 then
        Player.Functions.AddItem(rewarditem5, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem5], "add")
    end
end)

--------------------------------------------------------------------------------
-- SELL PELTS
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellPelts')
AddEventHandler('mack-fishandgame:server:sellPelts', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local haspelts = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                local itemName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount

                if itemName == "poor_bear_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_bear_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_bear_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_black_bear_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_black_bear_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_black_bear_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_boar_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_boar_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_boar_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_buck_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_buck_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_buck_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_buffalo_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_buffalo_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_buffalo_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_bull_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_bull_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_bull_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_cougar_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_cougar_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_cougar_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_cow_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_cow_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_cow_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_coyote_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_coyote_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_coyote_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_deer_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_deer_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_deer_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_elk_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_elk_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_elk_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_fox_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_fox_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_fox_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_goat_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_goat_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_goat_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_javelina_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_javelina_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_javelina_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_moose_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_moose_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_moose_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_ox_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_ox_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_ox_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_panther_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_panther_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_panther_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_pig_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_pig_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_pig_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_pronghorn_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_pronghorn_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_pronghorn_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_bighornram_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_bighornram_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_bighornram_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_sheep_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_sheep_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_sheep_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_wolf_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_wolf_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_wolf_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_alligator_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_alligator_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_alligator_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_alligator_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_boar_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_cougar_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_coyote_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_panther_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "legendary_wolf_pelt" then
                    price = price + (Config.LegendaryPeltPrice * Config.LegendaryMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "poor_raccoon_pelt" then
                    price = price + (Config.PoorPeltPrice * Config.PoorMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "good_raccoon_pelt" then
                    price = price + (Config.GoodPeltPrice * Config.GoodMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "perfect_raccoon_pelt" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                elseif itemName == "pelt_rabbit" then
                    price = price + (Config.PerfectPeltPrice * Config.PerfectMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); haspelts = true
                end
            end
        end
        if haspelts then
            Player.Functions.AddMoney(Config.PaymentType, price, "pelts-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.you_have_sold_all_your_pelts_for') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
            TriggerEvent('mack-levels:addXP', Player.PlayerData.citizenid, 1)
            haspelts = false
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.you_dont_have_any_pelts_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- SELL CARCASS (body parts)
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellCarcass')
AddEventHandler('mack-fishandgame:server:sellCarcass', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hascarcass = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                local itemName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount

                -- HEARTS
                if itemName == "heart_bear" then
                    price = price + (Config.GoodCarcassPrice * Config.GoodCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                elseif itemName == "heart_wolf" then
                    price = price + (Config.GoodCarcassPrice * Config.GoodCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                elseif itemName == "heart_deer" then
                    price = price + (Config.PerfectCarcassPrice * Config.PerfectCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                elseif itemName == "heart_chicken" then
                    price = price + (Config.PoorCarcassPrice * Config.PoorCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                -- BEAKS
                elseif itemName == "beak_bparrotf" or itemName == "beak_bbirdf" or itemName == "beak_daruf" or itemName == "beak_pelicanf" or itemName == "beak_loonf" or itemName == "beak_goosef" or itemName == "beak_turkeyf" or itemName == "beak_rspoonf" or itemName == "beak_bparrotf" or itemName == "beak_eaglef" or itemName == "beak_owlf" or itemName == "beak_duckf" or itemName == "tail_lizardl" or itemName == "horn_bull" or itemName == "horn_ox" or itemName == "horn_buckantler" or itemName == "claws_armadilloc" or itemName == "claws_eaglet" or itemName == "claws_owlt" or itemName == "tooth_aligatorto" or itemName == "tooth_coyotef" or itemName == "tooth_snaket" or itemName == "tooth_wolftooth" or itemName == "tail_chipmunk_c" then
                    price = price + (Config.PerfectCarcassPrice * Config.PerfectCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                elseif itemName == "beak_quailb" or itemName == "beak_boobyf" or itemName == "beak_condorf" or itemName == "beak_peasantf" or itemName == "beak_kbirdf" or itemName == "beak_egretf" or itemName == "beak_seagullf" or itemName == "beak_prairif" or itemName == "beak_chickenf" or itemName == "beak_hawkf" or itemName == "beak_ravenf" or itemName == "beak_vulturef" or itemName == "tail_beaver" or itemName == "tail_panthere" or itemName == "tail_rabbitpaw" or itemName == "horn_bison" or itemName == "horn_cowh" or itemName == "horn_prong" or itemName == "horn_ram" or itemName == "horn_elkantler" or itemName == "claws_beartc" or itemName == "claws_cockc" or itemName == "claws_hawkt" or itemName == "claws_ravenc" or itemName == "claws_opossumc" or itemName == "tooth_beart" or itemName == "tooth_cougarf" or itemName == "tooth_raccoont" or itemName == "tooth_foxt" or itemName == "tooth_turtlet" or itemName == "tooth_boarmusk" then
                    price = price + (Config.GoodCarcassPrice * Config.GoodCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                -- WHOLE ANIMALS / OTHER
                elseif itemName == "a_c_armadillo_01" or itemName == "a_c_woodpecker_01" or itemName == "wool" or itemName == "a_c_hawk_01" or itemName == "a_c_eagle_01" or itemName == "a_c_owl_01" or itemName == "a_c_raven_01" or itemName == "a_c_crow_01" or itemName == "a_c_cardinal_01" or itemName == "a_c_turkeywild_01" or itemName == "a_c_robin_01" or itemName == "a_c_bluejay_01" or itemName == "a_c_sparrow_01" or itemName == "a_c_songbird_01" or itemName == "a_c_seagull_01" or itemName == "a_c_duck_01" or itemName == "a_c_goosecanada_01" or itemName == "a_c_loon_01" or itemName == "a_c_parakeet_01" or itemName == "a_c_squirrel_01" or itemName == "fat" or itemName == "sinew" or itemName == "a_c_badger_01" or itemName == "a_c_muskrat_01" or itemName == "a_c_possum_01" or itemName == "a_c_rabbit_01" or itemName == "a_c_raccoon_01" or itemName == "a_c_rat_01" or itemName == "a_c_rat_01-3" or itemName == "a_c_rat_01-4" or itemName == "a_c_squirrel_01-2" or itemName == "a_c_squirrel_01-3" or itemName == "a_c_skunk_01" or itemName == "a_c_beaver_01" or itemName == "a_c_toad_01" or itemName == "a_c_snakeredboa_01" or itemName == "a_c_frogbull_01" then
                    price = price + (Config.GoodCarcassPrice * Config.GoodCarcassMultiplier * amount)
                    Player.Functions.RemoveItem(itemName, amount, k); hascarcass = true
                end
            end
        end
        if hascarcass then
            Player.Functions.AddMoney(Config.PaymentType, price, "carcass-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.you_have_sold_all_your_carcass_for') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
            hascarcass = false
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.you_dont_have_any_carcass_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- SELL FEATHERS
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellFeathers')
AddEventHandler('mack-fishandgame:server:sellFeathers', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hasfeathers = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "feathers" then
                price = price + (Config.FeathersPrice * Config.FeathersMultiplier * Player.PlayerData.items[k].amount)
                Player.Functions.RemoveItem("feathers", Player.PlayerData.items[k].amount, k)
                hasfeathers = true
            end
        end
        if hasfeathers then
            Player.Functions.AddMoney(Config.PaymentType, price, "feathers-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.you_have_sold_all_your_feathers_for') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
            hasfeathers = false
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.you_dont_have_any_feathers_to_sell'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- BUTCHER ANIMAL REWARD
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:reward')
AddEventHandler('mack-fishandgame:server:reward', function(rewardmoney, rewarditem, quality)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    if Config.Debug then
        print("money: " .. tostring(rewardmoney))
        print("item: " .. tostring(rewarditem))
        print("quality: " .. tostring(quality))
    end
    if quality == 'poor' then
        Player.Functions.AddMoney('cash', rewardmoney * Config.ButcherPoorMultiplier)
        Player.Functions.AddItem(rewarditem, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")
        TriggerEvent('mack-levels:addXP', Player.PlayerData.citizenid, 1)
    elseif quality == 'good' then
        Player.Functions.AddMoney('cash', rewardmoney * Config.ButcherGoodMultiplier)
        Player.Functions.AddItem(rewarditem, 2)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")
        TriggerEvent('mack-levels:addXP', Player.PlayerData.citizenid, 1)
    elseif quality == 'perfect' then
        Player.Functions.AddMoney('cash', rewardmoney * Config.ButcherPerfectMultiplier)
        Player.Functions.AddItem(rewarditem, 3)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")
        TriggerEvent('mack-levels:addXP', Player.PlayerData.citizenid, 1)
    end
end)

--------------------------------------------------------------------------------
-- FISH VENDOR - SELL SMALL FISH
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellSmallFish')
AddEventHandler('mack-fishandgame:server:sellSmallFish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hasfish = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                local itemName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount
                if itemName == "a_c_fishbluegil_01_sm" or itemName == "a_c_fishbullheadcat_01_sm" or itemName == "a_c_fishchainpickerel_01_sm" or itemName == "a_c_fishperch_01_sm" or itemName == "a_c_fishredfinpickerel_01_sm" or itemName == "a_c_fishrockbass_01_sm" then
                    price = price + (Config.SmallFishPrice * amount)
                    Player.Functions.RemoveItem(itemName, amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddMoney("cash", price, "fish-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.small_fish_sold') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.no_small_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- FISH VENDOR - SELL MEDIUM FISH
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellMediumFish')
AddEventHandler('mack-fishandgame:server:sellMediumFish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hasfish = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                local itemName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount
                if itemName == "a_c_fishbluegil_01_ms" or itemName == "a_c_fishbullheadcat_01_ms" or itemName == "a_c_fishchainpickerel_01_ms" or itemName == "a_c_fishlargemouthbass_01_ms" or itemName == "a_c_fishperch_01_ms" or itemName == "a_c_fishrainbowtrout_01_ms" or itemName == "a_c_fishredfinpickerel_01_ms" or itemName == "a_c_fishrockbass_01_ms" or itemName == "a_c_fishsalmonsockeye_01_ml" or itemName == "a_c_fishsalmonsockeye_01_ms" or itemName == "a_c_fishsmallmouthbass_01_ms" then
                    price = price + (Config.MediumFishPrice * amount)
                    Player.Functions.RemoveItem(itemName, amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddMoney("cash", price, "fish-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.medium_fish_sold') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.no_medium_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- FISH VENDOR - SELL LARGE FISH
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:sellLargeFish')
AddEventHandler('mack-fishandgame:server:sellLargeFish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hasfish = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                local itemName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount
                if itemName == "a_c_fishchannelcatfish_01_lg" or itemName == "a_c_fishchannelcatfish_01_xl" or itemName == "a_c_fishlakesturgeon_01_lg" or itemName == "a_c_fishlargemouthbass_01_lg" or itemName == "a_c_fishlongnosegar_01_lg" or itemName == "a_c_fishmuskie_01_lg" or itemName == "a_c_fishnorthernpike_01_lg" or itemName == "a_c_fishrainbowtrout_01_lg" or itemName == "a_c_fishsalmonsockeye_01_lg" or itemName == "a_c_fishsmallmouthbass_01_lg" then
                    price = price + (Config.LargeFishPrice * amount)
                    Player.Functions.RemoveItem(itemName, amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddMoney("cash", price, "fish-sold")
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.large_fish_sold') .. price, icon = 'tick', duration = 5000 }, 'SUCCESS')
        else
            TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.no_large_fish'), icon = 'cross', duration = 5000 }, 'ERROR')
        end
    end
end)

--------------------------------------------------------------------------------
-- BUY ITEM (from any vendor shop via NUI)
--------------------------------------------------------------------------------
RegisterServerEvent('mack-fishandgame:server:buyItem')
AddEventHandler('mack-fishandgame:server:buyItem', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local itemName = data.itemName
    local quantity = tonumber(data.quantity) or 1
    local vendorType = data.vendorType
    local shopConfig
    local paymentType = Config.PaymentType

    if vendorType == 'trapper' then
        shopConfig = Config.TrapperShop
    elseif vendorType == 'butcher' then
        shopConfig = Config.ButcherShop
        paymentType = 'cash'
    elseif vendorType == 'fishvendor' then
        shopConfig = Config.FishVendorShop
        paymentType = 'cash'
    else
        return
    end

    local foundItem = nil
    for k, v in pairs(shopConfig) do
        if v.name == itemName then
            foundItem = v
            break
        end
    end

    if not foundItem then
        TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.something_went_wrong'), icon = 'cross', duration = 5000 }, 'ERROR')
        return
    end

    if quantity < 1 or quantity > foundItem.amount then
        TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.invalid_quantity'), icon = 'cross', duration = 5000 }, 'ERROR')
        return
    end

    local totalPrice = foundItem.price * quantity
    local hasMoney = false
    if paymentType == 'cash' then
        hasMoney = Player.Functions.GetMoney('cash') >= totalPrice
    else
        hasMoney = Player.Functions.GetMoney('cash') >= totalPrice
    end

    if not hasMoney then
        TriggerClientEvent('bln_notify:send', src, { title = Lang:t('error.no_money'), icon = 'cross', duration = 5000 }, 'ERROR')
        return
    end

    Player.Functions.RemoveMoney(paymentType, totalPrice, "vendor-purchase")
    Player.Functions.AddItem(itemName, quantity)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], "add")
    TriggerClientEvent('bln_notify:send', src, { title = Lang:t('success.purchased') .. quantity .. 'x ' .. (RSGCore.Shared.Items[itemName] and RSGCore.Shared.Items[itemName].label or itemName) .. Lang:t('success.for_price') .. totalPrice, icon = 'tick', duration = 5000 }, 'SUCCESS')
end)
