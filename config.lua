Config = {}

-- global settings
Config.Debug = false
Config.SellTime = 10000
Config.ShowBlips = true
Config.PaymentType = 'cash'
Config.DistanceSpawn = 20.0

-- blip settings - trapper
Config.TrapperBlip = {
    blipName = "Trapper's",
    blipSprite = 'blip_shop_animal_trapper',
    blipScale = 0.2
}

-- blip settings - butcher
Config.ButcherBlip = {
    blipName = 'Butcher',
    blipSprite = 'blip_shop_butcher',
    blipScale = 0.2
}

-- blip settings - fish vendor
Config.FishVendorBlip = {
    blipName = 'Fish Vendor',
    blipSprite = 'blip_mg_fishing',
    blipScale = 0.2
}

--------------------------------------------------------------------------------
-- TRAPPER LOCATIONS
--------------------------------------------------------------------------------
Config.TrapperLocations = {
    {name = 'Valentine Trapper',      location = 'valentine-trapper',     coords = vector3(-333.9737, 773.49157, 116.22194), model = 'u_m_m_story_hunter_01', heading = 111.8759, showblip = true },
    {name = 'St Denis Trapper',       location = 'stdenis-trapper',       coords = vector3(2832.3193, -1223.699, 47.654289), model = 'U_M_M_SDTRAPPER_01', heading = 190.36814, showblip = true },
    {name = 'Riggs Station Trapper',  location = 'riggsstation-trapper',  coords = vector3(-1007.607, -549.5084, 99.39138), model = 'U_M_M_SDTRAPPER_01', heading = 282.4226, showblip = true },
    {name = 'West Elizabeth Trapper', location = 'westelizabeth-trapper', coords = vector3(-2844.197, 142.13876, 184.61907), model = 'U_M_M_SDTRAPPER_01', heading = 255.25524, showblip = true },
    {name = 'Stawberry Trapper',      location = 'stawberry-trapper',     coords = vector3(-1745.992, -388.9831, 156.59568), model = 'U_M_M_SDTRAPPER_01', heading = 107.79673, showblip = true },
    {name = 'Tumbleweed Trapper',     location = 'tumbleweed-trapper',    coords = vector3(-5511.721, -2951.048, -1.83548), model = 'U_M_M_SDTRAPPER_01', heading = 165.87483, showblip = true },
    {name = 'Emerald Ranch Trapper',  location = 'grifflies-trapper',     coords = vector3(1420.7045, 381.54498, 89.974464), model = 'U_M_M_SDTRAPPER_01', heading = 169.59, showblip = true },
    {name = 'Roanake Trapper',        location = 'roanake-trapper',       coords = vector3(2539.4578, 809.7834, 75.9239), model = 'U_M_M_SDTRAPPER_01', heading = 0.0, showblip = true },
    {name = 'Emerald Ranch Trapper 2',location = 'emeraldranch-trapper',  coords = vector3(1421.8361, 365.23251, 89.020332), model = 'U_M_M_SDTRAPPER_01', heading = -93.84, showblip = true },
    {name = 'Ambario Trapper',        location = 'ambario-trapper',       coords = vector3(-1633.170, 1235.340, 351.892), model = 'U_M_M_SDTRAPPER_01', heading = 0.0, showblip = true },
    {name = 'Corngual Trapper',       location = 'corngual-trapper',      coords = vector3(497.839, 580.183, 110.1711), model = 'U_M_M_SDTRAPPER_01', heading = 0.0, showblip = true },
    {name = 'Heartlands Trapper',     location = 'heartlands-trapper',    coords = vector3(-128.092, -23.935, 96.100), model = 'U_M_M_SDTRAPPER_01', heading = 0.0, showblip = true },
    {name = 'Manzanita Trapper',      location = 'manzanita-trapper',     coords = vector3(-1981.611, -1650.570, 117.099), model = 'U_M_M_SDTRAPPER_01', heading = 107.79673, showblip = true },
    {name = 'Rhodes Trapper',         location = 'rhodes-trapper',        coords = vector3(1304.97, -1276.57, 75.96), model = 'cs_famousgunslinger_02', heading = 117.67, showblip = true },
    {name = 'Kamassa River Trapper B',location = 'kamassariverb-trapper', coords = vector3(-4621.124, -3366.574, 21.975), model = 'U_M_M_SDTRAPPER_01', heading = 0.0, showblip = true },
    {name = 'Guarma Trapper',         location = 'guarma-trapper',        coords = vector3(315.79, 1492.04, 181.28), model = 'U_M_M_SDTRAPPER_01', heading = -106.72, showblip = true },
    {name = 'Vanhorn Trapper',        location = 'vanhorn-trapper',       coords = vector3(2998.93, 568.05, 44.48), model = 'u_m_m_story_hunter_01', heading = 93.31, showblip = true },
    {name = 'Blackwater Trapper',     location = 'blackwater-trapper',    coords = vector3(-756.40, -1289.00, 43.68), model = 'u_m_m_story_hunter_01', heading = 275.12, showblip = true },
}

--------------------------------------------------------------------------------
-- TRAPPER SHOP
--------------------------------------------------------------------------------
Config.TrapperShop = {
    [1] = { name = 'legendarymap', price = 1000, amount = 50, info = {}, type = 'item', slot = 1 },
    [2] = { name = 'beartrap', price = 150, amount = 50, info = {}, type = 'item', slot = 2 },
}

--------------------------------------------------------------------------------
-- TRAPPER XP & MULTIPLIERS
--------------------------------------------------------------------------------
Config.Xp = 0.05
Config.Xp1 = 0.10
Config.Xp2 = 0.15
Config.Xp3 = 0.20
Config.Xp4 = 0.05

Config.PoorMultiplier = 1
Config.GoodMultiplier = 1
Config.PerfectMultiplier = 1
Config.LegendaryMultiplier = 1

Config.PoorCarcassMultiplier = 1
Config.GoodCarcassMultiplier = 1
Config.PerfectCarcassMultiplier = 1
Config.LegendaryCarcassMultiplier = 1

Config.FeathersMultiplier = 2

Config.PoorPeltPrice = math.random(1, 5)
Config.GoodPeltPrice = math.random(5, 10)
Config.PerfectPeltPrice = math.random(10, 15)
Config.LegendaryPeltPrice = math.random(15, 20)
Config.FeathersPrice = math.random(1, 5)
Config.PoorCarcassPrice = math.random(1, 5)
Config.GoodCarcassPrice = math.random(5, 10)
Config.PerfectCarcassPrice = math.random(15, 20)
Config.LegendaryCarcassPrice = math.random(22, 25)

--------------------------------------------------------------------------------
-- TRAPPER PELTS
--------------------------------------------------------------------------------
Config.Pelts = {

    -- BEAR
    { pelthash = 957520252,   name = 'Poor Bear Pelt',   rewarditem1 = 'poor_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },
    { pelthash = 143941906,   name = 'Good Bear Pelt',   rewarditem1 = 'good_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },
    { pelthash = 1292673537,  name = 'Perfect Bear Pelt',rewarditem1 = 'perfect_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },

    -- BLACK_BEAR
    { pelthash = 1083865179,  name = 'Poor Black Bear Pelt',   rewarditem1 = 'poor_black_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },
    { pelthash = 1490032862,  name = 'Good Black Bear Pelt',   rewarditem1 = 'good_black_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },
    { pelthash = 663376218,   name = 'Perfect Black Bear Pelt',rewarditem1 = 'perfect_black_bear_pelt', rewarditem2 = 'heart_bear', rewarditem3 = 'fat', rewarditem4 = 'claws_beartc' },

    -- BOAR
    { pelthash = 1248540072,  name = 'Poor Boar Pelt',   rewarditem1 = 'poor_boar_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },
    { pelthash = 2116849039,  name = 'Good Boar Pelt',   rewarditem1 = 'good_boar_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },
    { pelthash = -1858513856, name = 'Perfect Boar Pelt',rewarditem1 = 'perfect_boar_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },

    -- BUCK
    { pelthash = 1603936352,  name = 'Poor Buck Pelt',   rewarditem1 = 'poor_buck_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'fat', rewarditem4 = 'raw_meat' },
    { pelthash = -702790226,  name = 'Good Buck Pelt',   rewarditem1 = 'good_buck_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'fat', rewarditem4 = 'raw_meat' },
    { pelthash = -868657362,  name = 'Perfect Buck Pelt',rewarditem1 = 'perfect_buck_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'fat', rewarditem4 = 'raw_meat' },

    -- BUFFALO
    { pelthash = -1730060063, name = 'Poor Buffalo Pelt',   rewarditem1 = 'poor_buffalo_pelt', rewarditem2 = 'fiber_woolblack', rewarditem3 = 'large_raw_meat' },
    { pelthash = -591117838,  name = 'Good Buffalo Pelt',   rewarditem1 = 'good_buffalo_pelt', rewarditem2 = 'fiber_woolblack', rewarditem3 = 'large_raw_meat' },
    { pelthash = -237756948,  name = 'Perfect Buffalo Pelt',rewarditem1 = 'perfect_buffalo_pelt', rewarditem2 = 'fiber_woolblack', rewarditem3 = 'large_raw_meat' },

    -- BULL
    { pelthash = 9293261,     name = 'Poor Bull Hide',   rewarditem1 = 'poor_bull_pelt', rewarditem2 = 'horn_bull', rewarditem3 = 'tail_bull', rewarditem4 = 'large_raw_meat' },
    { pelthash = -536086818,  name = 'Good Bull Hide',   rewarditem1 = 'good_bull_pelt', rewarditem2 = 'horn_bull', rewarditem3 = 'tail_bull', rewarditem4 = 'large_raw_meat' },
    { pelthash = -53270317,   name = 'Perfect Bull Hide',rewarditem1 = 'poor_bull_pelt', rewarditem2 = 'horn_bull', rewarditem3 = 'tail_bull', rewarditem4 = 'large_raw_meat' },

    -- COUGAR
    { pelthash = 1914602340,  name = 'Poor Cougar Pelt',   rewarditem1 = 'poor_cougar_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_cougarf', rewarditem4 = 'raw_meat' },
    { pelthash = 459744337,   name = 'Good Cougar Pelt',   rewarditem1 = 'good_cougar_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_cougarf', rewarditem4 = 'raw_meat' },
    { pelthash = -1791452194, name = 'Perfect Cougar Pelt',rewarditem1 = 'perfect_cougar_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_cougarf', rewarditem4 = 'raw_meat' },

    -- COW
    { pelthash = 334093551,   name = 'Poor Cow Hide',   rewarditem1 = 'poor_cow_pelt', rewarditem2 = 'horn_cowh', rewarditem3 = 'large_raw_meat' },
    { pelthash = 1150594075,  name = 'Good Cow Hide',   rewarditem1 = 'good_cow_pelt', rewarditem2 = 'horn_cowh', rewarditem3 = 'large_raw_meat' },
    { pelthash = -845037222,  name = 'Perfect Cow Hide',rewarditem1 = 'perfect_cow_pelt', rewarditem2 = 'horn_cowh', rewarditem3 = 'large_raw_meat' },

    -- COYOTE
    { pelthash = -1558096473, name = 'Poor Coyote Pelt',   rewarditem1 = 'poor_coyote_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_coyotef', rewarditem4 = 'small_raw_meat' },
    { pelthash = 1150939141,  name = 'Good Coyote Pelt',   rewarditem1 = 'good_coyote_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_coyotef', rewarditem4 = 'small_raw_meat' },
    { pelthash = -794277189,  name = 'Perfect Coyote Pelt',rewarditem1 = 'perfect_coyote_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_coyotef', rewarditem4 = 'small_raw_meat' },

    -- DEER
    { pelthash = -662178186,  name = 'Poor Deer Pelt',   rewarditem1 = 'poor_deer_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'raw_meat' },
    { pelthash = -1827027577, name = 'Good Deer Pelt',   rewarditem1 = 'good_deer_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'raw_meat' },
    { pelthash = -1035515486, name = 'Perfect Deer Pelt',rewarditem1 = 'perfect_deer_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'raw_meat' },

    -- ELK
    { pelthash = 2053771712,  name = 'Poor Elk Pelt',   rewarditem1 = 'poor_elk_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_elkantler' },
    { pelthash = 1181652728,  name = 'Good Elk Pelt',   rewarditem1 = 'good_elk_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_elkantler', rewarditem4 = 'raw_meat' },
    { pelthash = -1332163079, name = 'Perfect Elk Pelt',rewarditem1 = 'perfect_elk_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_elkantler', rewarditem4 = 'raw_meat' },

    -- FOX
    { pelthash = 1647012424,  name = 'Poor Fox Pelt',   rewarditem1 = 'poor_fox_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_foxt', rewarditem4 = 'small_raw_meat' },
    { pelthash = 238733925,   name = 'Good Fox Pelt',   rewarditem1 = 'good_fox_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_foxt', rewarditem4 = 'small_raw_meat' },
    { pelthash = 500722008,   name = 'Perfect Fox Pelt',rewarditem1 = 'perfect_fox_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_foxt', rewarditem4 = 'small_raw_meat' },

    -- GOAT
    { pelthash = 699990316,   name = 'Poor Goat Hide',   rewarditem1 = 'poor_goat_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_ram', rewarditem4 = 'small_raw_meat' },
    { pelthash = 1710714415,  name = 'Good Goat Hide',   rewarditem1 = 'good_goat_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_ram', rewarditem4 = 'small_raw_meat' },
    { pelthash = -1648383828, name = 'Perfect Goat Hide',rewarditem1 = 'perfect_goat_pelt', rewarditem2 = 'heart_deer', rewarditem3 = 'horn_ram', rewarditem4 = 'raw_meat' },

    -- JAVELINA
    { pelthash = -99092070,   name = 'Poor Peccary Pig Pelt',   rewarditem1 = 'poor_javelina_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },
    { pelthash = -1379330323, name = 'Good Peccary Pig Pelt',   rewarditem1 = 'good_javelina_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },
    { pelthash = 1963510418,  name = 'Perfect Peccary Pig Pelt',rewarditem1 = 'perfect_javelina_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },

    -- MOOSE
    { pelthash = 1868576868,  name = 'Poor Moose Pelt',   rewarditem1 = 'poor_moose_pelt', rewarditem2 = 'large_raw_meat' },
    { pelthash = 1636891382,  name = 'Good Moose Pelt',   rewarditem1 = 'good_moose_pelt', rewarditem2 = 'large_raw_meat' },
    { pelthash = -217731719,  name = 'Perfect Moose Pelt',rewarditem1 = 'perfect_moose_pelt', rewarditem2 = 'large_raw_meat' },

    -- OXEN
    { pelthash = 462348928,   name = 'Poor Ox Hide',   rewarditem1 = 'poor_ox_pelt', rewarditem2 = 'horn_ox', rewarditem3 = 'wool', rewarditem4 = 'large_raw_meat' },
    { pelthash = 1208128650,  name = 'Good Ox Hide',   rewarditem1 = 'good_ox_pelt', rewarditem2 = 'horn_ox', rewarditem3 = 'wool', rewarditem4 = 'large_raw_meat' },
    { pelthash = 659601266,   name = 'Perfect Ox Hide',rewarditem1 = 'perfect_ox_pelt', rewarditem2 = 'horn_ox', rewarditem3 = 'wool', rewarditem4 = 'large_raw_meat' },

    -- PANTHER
    { pelthash = 1584468323,  name = 'Poor Panther Pelt',   rewarditem1 = 'poor_panther_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tail_panthere', rewarditem4 = 'large_raw_meat' },
    { pelthash = -395646254,  name = 'Good Panther Pelt',   rewarditem1 = 'good_panther_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tail_panthere', rewarditem4 = 'large_raw_meat' },
    { pelthash = 1969175294,  name = 'Perfect Panther Pelt',rewarditem1 = 'perfect_panther_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tail_panthere', rewarditem4 = 'large_raw_meat' },

    -- PIG
    { pelthash = -308965548,  name = 'Poor Pig Hide',   rewarditem1 = 'poor_pig_pelt', rewarditem2 = 'fat', rewarditem3 = 'raw_meat' },
    { pelthash = -57190831,   name = 'Good Pig Hide',   rewarditem1 = 'good_pig_pelt', rewarditem2 = 'fat', rewarditem3 = 'raw_meat' },
    { pelthash = -1102272634, name = 'Perfect Pig Hide',rewarditem1 = 'perfect_pig_pelt', rewarditem2 = 'fat', rewarditem3 = 'raw_meat' },

    -- PRONGHORN
    { pelthash = -983605026,  name = 'Poor Pronghorn Hide',   rewarditem1 = 'poor_pronghorn_pelt', rewarditem2 = 'horn_prong', rewarditem3 = 'raw_meat' },
    { pelthash = -1544126829, name = 'Good Pronghorn Hide',   rewarditem1 = 'good_pronghorn_pelt', rewarditem2 = 'horn_prong', rewarditem3 = 'raw_meat' },
    { pelthash = 554578289,   name = 'Perfect Pronghorn Hide',rewarditem1 = 'perfect_pronghorn_pelt', rewarditem2 = 'horn_prong', rewarditem3 = 'raw_meat' },

    -- RAM
    { pelthash = 1796037447,  name = 'Poor Ram Hide',   rewarditem1 = 'poor_bighornram_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'horn_ram', rewarditem4 = 'raw_meat' },
    { pelthash = -476045512,  name = 'Good Ram Hide',   rewarditem1 = 'good_bighornram_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'horn_ram', rewarditem4 = 'raw_meat' },
    { pelthash = 1795984405,  name = 'Perfect Ram Hide',rewarditem1 = 'perfect_bighornram_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'horn_ram', rewarditem4 = 'raw_meat' },

    -- SHEEP
    { pelthash = 1729948479,  name = 'Poor Sheep Hide',   rewarditem1 = 'poor_sheep_pelt', rewarditem2 = 'wool', rewarditem3 = 'small_raw_meat' },
    { pelthash = -1317365569, name = 'Good Sheep Hide',   rewarditem1 = 'good_sheep_pelt', rewarditem2 = 'wool', rewarditem3 = 'small_raw_meat' },
    { pelthash = 1466150167,  name = 'Perfect Sheep Hide',rewarditem1 = 'perfect_sheep_pelt', rewarditem2 = 'wool', rewarditem3 = 'small_raw_meat' },

    -- WOLF
    { pelthash = 85441452,    name = 'Poor Wolf Pelt',   rewarditem1 = 'poor_wolf_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_wolftooth', rewarditem4 = 'raw_meat' },
    { pelthash = 1145777975,  name = 'Good Wolf Pelt',   rewarditem1 = 'good_wolf_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_wolftooth', rewarditem4 = 'raw_meat' },
    { pelthash = 653400939,   name = 'Perfect Wolf Pelt',rewarditem1 = 'perfect_wolf_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_wolftooth', rewarditem4 = 'raw_meat' },

    -- ALLIGATOR
    { pelthash = 1806153689,  name = 'Poor Alligator Skin',   rewarditem1 = 'poor_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -802026654,  name = 'Good Alligator Skin',   rewarditem1 = 'good_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -1625078531, name = 'Perfect Alligator Skin',rewarditem1 = 'perfect_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -1243878166, name = 'Poor Alligator Skin',   rewarditem1 = 'poor_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -802026654,  name = 'Good Alligator Skin',   rewarditem1 = 'good_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -1475338121, name = 'Perfect Alligator Skin',rewarditem1 = 'perfect_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },

    -- RACCOON
    { pelthash = 1992476687,  name = 'Poor Raccoon Pelt',   rewarditem1 = 'poor_raccoon_pelt', rewarditem2 = 'tooth_raccoont', rewarditem3 = 'small_raw_meat' },
    { pelthash = -1178296218, name = 'Good Raccoon Pelt',   rewarditem1 = 'good_raccoon_pelt', rewarditem2 = 'tooth_raccoont', rewarditem3 = 'small_raw_meat' },
    { pelthash = -305970307,  name = 'Perfect Raccoon Pelt',rewarditem1 = 'perfect_raccoon_pelt', rewarditem2 = 'tooth_raccoont', rewarditem3 = 'small_raw_meat' },

    -- LEGENDARY
    { pelthash = -1621144167, name = 'Legendary Sun Gator Skin',     rewarditem1 = 'legendary_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = 674287411,   name = 'Legendary Sun Gator Skin',     rewarditem1 = 'legendary_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = 2028722809,  name = 'Legendary Sun Gator Skin',     rewarditem1 = 'legendary_alligator_pelt', rewarditem2 = 'tail_beaver', rewarditem3 = 'tooth_aligatorto', rewarditem4 = 'large_raw_meat' },
    { pelthash = -251416414,  name = 'Legendary Moon Beaver Pelt',   rewarditem1 = 'legendary_beaver_pelt', rewarditem2 = 'small_raw_meat' },
    { pelthash = -1149999295, name = 'Legendary Beaver Pelt',        rewarditem1 = 'legendary_beaver_pelt', rewarditem2 = 'small_raw_meat' },
    { pelthash = -1249752300, name = 'Legendary Wakpa Boar Pelt',    rewarditem1 = 'legendary_boar_pelt', rewarditem2 = 'fat', rewarditem3 = 'tooth_boarmusk', rewarditem4 = 'raw_meat' },
    { pelthash = 397926876,   name = 'Legendary Maza Cougar Pelt',   rewarditem1 = 'legendary_cougar_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_cougarf', rewarditem4 = 'raw_meat' },
    { pelthash = -1433814131, name = 'Legendary Maza Cougar Pelt',   rewarditem1 = 'legendary_cougar_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_cougarf', rewarditem4 = 'raw_meat' },
    { pelthash = 1728819413,  name = 'Legendary Midnight Paw Coyote Pelt', rewarditem1 = 'legendary_coyote_pelt', rewarditem2 = 'tail_chipmunk_c', rewarditem3 = 'tooth_coyotef', rewarditem4 = 'raw_meat' },
    { pelthash = 836208559,   name = 'Legendary Ghost Panther Pelt',    rewarditem1 = 'legendary_panther_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tail_panthere', rewarditem4 = 'raw_meat' },
    { pelthash = -1189368951, name = 'Legendary Nightwalker Panther Pelt', rewarditem1 = 'legendary_panther_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tail_panthere', rewarditem4 = 'raw_meat' },
    { pelthash = -1548204069, name = 'Legendary Onyx Wolf Pelt',       rewarditem1 = 'legendary_wolf_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_wolftooth', rewarditem4 = 'raw_meat' },
    { pelthash = -1946740647, name = 'Legendary Emerald Wolf Pelt',    rewarditem1 = 'legendary_wolf_pelt', rewarditem2 = 'heart_wolf', rewarditem3 = 'tooth_wolftooth', rewarditem4 = 'raw_meat' },
}

--------------------------------------------------------------------------------
-- TRAPPER ANIMALS (gathered/looted animals)
--------------------------------------------------------------------------------
Config.TrapperAnimals = {
    { modelhash = -229688157,    name = 'Water snake',           rewarditem2 = 'tooth_snaket', rewarditem3 = 'small_raw_meat' },
    { modelhash = -1790499186,   name = 'Snake Red Boa',         rewarditem2 = 'tooth_snaket', rewarditem3 = 'small_raw_meat' },
    { modelhash = 1464167925,    name = 'Snake Fer-De-Lance',    rewarditem2 = 'tooth_snaket', rewarditem3 = 'small_raw_meat' },
    { modelhash = 846659001,     name = 'Black-Tailed Rattlesnake', rewarditem2 = 'tooth_snaket', rewarditem3 = 'small_raw_meat' },
    { modelhash = 545068538,     name = 'Western Rattlesnake',   rewarditem2 = 'tooth_snaket', rewarditem3 = 'small_raw_meat' },
    { modelhash = -1003616053,   name = 'Pato',                  rewarditem1 = 'beak_duckf', rewarditem2 = 'heart_chicken', rewarditem3 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1459778951,    name = 'Aguila',                rewarditem2 = 'claws_eaglet', rewarditem3 = 'beak_eaglef', rewarditem4 = 'heart_chicken', rewarditem5 = 'feathers' },
    { modelhash = 831859211,     name = 'Egret',                 rewarditem2 = 'beak_egretf', rewarditem3 = 'heart_chicken', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1104697660,    name = 'Buitre Cabecirrojo occ',rewarditem2 = 'beak_vulturef', rewarditem3 = 'heart_chicken', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -466054788,    name = 'Pavo salvaje',          rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -2011226991,   name = 'Pavo salvaje',          rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -166054593,    name = 'Pavo salvaje',          rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -164963696,    name = 'Herring Seagull',       rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'small_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -1076508705,   name = 'Herring Seagull',       rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 2023522846,    name = 'Dominique Rooster',     rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -466687768,    name = 'Red-Footed Booby',      rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -575340245,    name = 'Wester Raven',          rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 2079703102,    name = 'Greater Prairie Chicken', rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1416324601,    name = 'Ring-Necked Pheasant',  rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1265966684,    name = 'American White Pelican', rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -1797450568,   name = 'Blue And Yellow Macaw', rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1205982615,    name = 'Californian Condor',    rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -2063183075,   name = 'Dominique Chicken',     rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -2063183075,   name = 'Double-Crested Cormorant', rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -564099192,    name = 'Whooping Crane',        rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 723190474,     name = 'Canada Goose',          rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'large_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -2145890973,   name = 'Ferruinous Hawk',       rewarditem2 = 'claws_hawkt', rewarditem3 = 'beak_hawkf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 1095117488,    name = 'Great Blue Heron',      rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'small_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = 386506078,     name = 'Common Loon',           rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'small_bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -861544272,    name = 'Great Horned Owl',      rewarditem2 = 'heart_chicken', rewarditem3 = 'beak_turkeyf', rewarditem4 = 'bird_meat', rewarditem5 = 'feathers' },
    { modelhash = -541762431,    name = 'Black Tailed Jackrabbit', rewarditem2 = 'tail_rabbitpaw', rewarditem3 = 'small_raw_meat', rewarditem4 = 'small_bird_meat' },
    { modelhash = -1797625440,   name = 'Armadillo',             rewarditem2 = 'small_raw_meat', rewarditem3 = 'small_raw_meat', rewarditem4 = 'claws_armadilloc' },
    { modelhash = -1170118274,   name = 'American Badger',       rewarditem2 = 'small_raw_meat', rewarditem3 = 'small_raw_meat', rewarditem4 = 'claws_opossumc' },
    { modelhash = 1465438313,    name = 'Grey Squirrel',         rewarditem2 = 'claws_opossumc', rewarditem3 = 'small_raw_meat', rewarditem4 = 'claws_opossumc' },
    { modelhash = 515943817,     name = 'Zarigueya de virginia', rewarditem2 = 'claws_opossumc', rewarditem3 = 'small_raw_meat', rewarditem4 = 'claws_opossumc' },
    { modelhash = 311947389,     name = 'Liebre de cola Negra',  rewarditem2 = 'tail_rabbitpaw', rewarditem3 = 'small_raw_meat', rewarditem4 = 'small_raw_meat' },
    { modelhash = -1211566332,   name = 'Stripped Skunk',        rewarditem2 = 'claws_opossumc', rewarditem3 = 'small_raw_meat' },
    { modelhash = -547982328,    name = 'Cuervo Grande Occidental', rewarditem2 = 'beak_ravenf', rewarditem3 = 'bird_meat', rewarditem4 = 'heart_chicken', rewarditem5 = 'feathers' },
    { modelhash = -1350548143,   name = 'Ratonero Calzado',      rewarditem2 = 'beak_hawkf', rewarditem3 = 'bird_meat', rewarditem4 = 'claws_hawkt', rewarditem5 = 'feathers' },
    { modelhash = -547982328,    name = 'Urogallo Grande',       rewarditem1 = 'beak_prairif', rewarditem2 = 'bird_meat', rewarditem3 = 'heart_chicken', rewarditem5 = 'feathers' },
}

--------------------------------------------------------------------------------
-- TRAPPER CARCASS REFERENCE
--------------------------------------------------------------------------------
Config.Carcass = {
    'claws_armadilloc', 'rat_c', 'a_c_squirrel_01', 'horn_prong', 'horn_bull', 'horn_cowh', 'wool',
    'heart_chicken', 'fat', 'beak_eaglef', 'claws_eaglet', 'beak_hawkf', 'claws_hawkt',
    'beak_egretf', 'beak_turkeyf', 'beak_seagullf', 'beak_rspoonf', 'claws_cockc',
    'beak_boobyf', 'claws_ravenc', 'beak_ravenf', 'beak_peasantf', 'beak_pelicanf',
    'beak_bparrotf', 'beak_condorf', 'beak_bbirdf', 'claws_owlt', 'beak_owlf', 'beak_goosef',
    'beak_kbirdf', 'tail_chipmunk_c', 'beak_chickenf', 'beak_prairif', 'beak_vulturef',
    'beak_duckf', 'tooth_boartusk', 'horn_bison', 'claws_beartc', 'tooth_beart', 'heart_bear',
    'heart_wolf', 'heart_deer', 'horn_elkantler', 'horn_ram', 'tooth_wolftooth', 'tail_panthere',
    'tooth_cougarf', 'tail_beaver', 'tooth_aligatorto', 'tail_rabbitpaw', 'tooth_raccoont',
    'claws_opossumc', 'tail_chipmunk_c', 'tooth_foxt', 'tooth_coyotef', 'tooth_boarmusk',
    'tooth_turtlet', 'tooth_snaket', 'sinew', 'feathers',
    'a_c_armadillo_01', 'a_c_badger_01', 'a_c_muskrat_01', 'a_c_possum_01', 'a_c_rabbit_01',
    'a_c_raccoon_01', 'a_c_rat_01', 'a_c_rat_01-3', 'a_c_rat_01-4', 'a_c_squirrel_01',
    'a_c_squirrel_01-2', 'a_c_squirrel_01-3', 'a_c_skunk_01', 'a_c_beaver_01', 'a_c_toad_01',
    'a_c_snakeredboa_01', 'a_c_rabbit_01', 'a_c_frogbull_01', 'a_c_woodpecker_01', 'a_c_loon_01',
    'a_c_goosecanada_01', 'a_c_hawk_01', 'a_c_eagle_01', 'a_c_owl_01', 'a_c_crow_01',
    'a_c_cardinal_01', 'a_c_turkeywild_01', 'a_c_robin_01', 'a_c_sparrow_01', 'a_c_songbird_01',
    'a_c_seagull_01', 'a_c_duck_01', 'a_c_parakeet_01',
}

--------------------------------------------------------------------------------
-- BUTCHER LOCATIONS
--------------------------------------------------------------------------------
Config.ButcherLocations = {
    {name = 'St Denis Butcher',      location = 'stdenis-butcher',      coords = vector3(2817.6848, -1323.25, 46.607814), model = 'U_M_M_VALBUTCHER_01', heading = 54.587085, showblip = true},
    {name = 'Valentine Butcher',     location = 'valentine-butcher',    coords = vector3(-339.26, 767.7, 116.57), model = 'mp_u_m_m_fos_railway_hunter_01', heading = 103.16, showblip = true},
    {name = 'Rhodes Butcher',        location = 'rhodes-butcher',       coords = vector3(1297.3735, -1277.661, 75.876304), model = 'U_M_M_VALBUTCHER_01', heading = 158.4201, showblip = true},
    {name = 'Annesburg Butcher',     location = 'annesburg-butcher',    coords = vector3(2934.1706, 1301.2891, 44.483638), model = 'U_M_M_VALBUTCHER_01', heading = 78.346809, showblip = true},
    {name = 'Tumbleweed Butcher',    location = 'tumbleweed-butcher',   coords = vector3(-5509.831, -2947.271, -1.89185), model = 'U_M_M_VALBUTCHER_01', heading = 256.48596, showblip = true},
    {name = 'Blackwater Butcher',    location = 'blackwater-butcher',   coords = vector3(-753.0086, -1284.84, 43.470008), model = 'U_M_M_VALBUTCHER_01', heading = 267.18395, showblip = true},
    {name = 'Strawberry Butcher',    location = 'strawberry-butcher',   coords = vector3(-1753.137, -392.8364, 156.24348), model = 'U_M_M_VALBUTCHER_01', heading = 189.32403, showblip = true},
    {name = 'Van Horn Butcher',      location = 'vanhorn-butcher',      coords = vector3(2992.4711, 572.20001, 44.365322), model = 'U_M_M_VALBUTCHER_01', heading = 263.94104, showblip = true},
    {name = 'Spider Gorge Butcher',  location = 'spidergorge-butcher',  coords = vector3(-1356.811, 2420.0056, 307.49148), model = 'U_M_M_VALBUTCHER_01', heading = 301.39794, showblip = true},
    {name = 'Riggs Station Butcher', location = 'riggsstation-butcher', coords = vector3(-1007.92, -541.2982, 99.108978), model = 'U_M_M_VALBUTCHER_01', heading = 281.41009, showblip = true},
    {name = 'Guarma Butcher',        location = 'guarma-butcher',       coords = vector3(1248.7127, -7043.3994, 41.842674), model = 'U_M_M_VALBUTCHER_01', heading = -129.09, showblip = true},
}

--------------------------------------------------------------------------------
-- BUTCHER SHOP
--------------------------------------------------------------------------------
Config.ButcherShop = {
    [1] = { name = 'raw_meat', price = 3, amount = 500, info = {}, type = 'item', slot = 1 },
}

--------------------------------------------------------------------------------
-- BUTCHER MULTIPLIERS
--------------------------------------------------------------------------------
Config.ButcherPoorMultiplier = 1
Config.ButcherGoodMultiplier = 1.5
Config.ButcherPerfectMultiplier = 2

--------------------------------------------------------------------------------
-- BUTCHER ANIMALS (carried animal models)
--------------------------------------------------------------------------------
Config.ButcherAnimals = {
    { name = 'Bear',                  model = -1124266369,             rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'Big Horn Ram',          model = -15687816381,            rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'Boar',                  model = 2028722809,              rewardmoney = 2.5, rewarditem = 'raw_meat' },
    { name = 'Buck',                  model = -1963605336,             rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'Bison',                 model = 1556473961,              rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Bull',                  model = 195700131,               rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Deer',                  model = 1110710183,              rewardmoney = 2.5, rewarditem = 'raw_meat' },
    { name = 'Duck',                  model = -1003616053,             rewardmoney = 0.5, rewarditem = 'bird_meat' },
    { name = 'Eagle',                 model = 1459778951,              rewardmoney = 0.5, rewarditem = 'large_bird_meat' },
    { name = 'Egret',                 model = 831859211,               rewardmoney = 0.5, rewarditem = 'bird_meat' },
    { name = 'Elk',                   model = -2021043433,             rewardmoney = 7,   rewarditem = 'raw_meat' },
    { name = 'American Red Fox',      model = 252669332,               rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'Big Grey Wolf',         model = -1143398950,             rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'Medium Grey Wolf',      model = -885451903,              rewardmoney = 8,   rewarditem = 'raw_meat' },
    { name = 'Small Grey Wolf',       model = -829273561,              rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'Vulture',               model = 1104697660,              rewardmoney = 2,   rewarditem = 'large_bird_meat' },
    { name = 'Snapping Turtle',       model = -407730502,              rewardmoney = 1,   rewarditem = 'raw_meat' },
    { name = 'Wild Turkey',           model = -466054788,              rewardmoney = 1,   rewarditem = 'large_bird_meat' },
    { name = 'Wild Turkey',           model = -2011226991,             rewardmoney = 1,   rewarditem = 'large_bird_meat' },
    { name = 'Wild Turkey',           model = -166054593,              rewardmoney = 1,   rewarditem = 'large_bird_meat' },
    { name = 'Water Snake',           model = -229688157,              rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Water Snake',           model = -229688157,              rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Snake Red Boa',         model = -1790499186,             rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Snake Fer-De-Lance',    model = 1464167925,              rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Black-Tailed Rattlesnake', model = 846659001,            rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Western Rattlesnake',   model = 545068538,               rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Striped Skunk',         model = -1211566332,             rewardmoney = 8,   rewarditem = 'raw_meat' },
    { name = 'Merino Sheep',          model = 40345436,                rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'Herring Seagull',       model = -164963696,              rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Roseate Spoonbill',     model = -1076508705,             rewardmoney = 2,   rewarditem = 'bird_meat' },
    { name = 'Dominique Rooster',     model = 2023522846,              rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Red-Footed Booby',      model = -466687768,              rewardmoney = 3,   rewarditem = 'bird_meat' },
    { name = 'Wester Raven',          model = -575340245,              rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'North American Racoon', model = 1458540991,              rewardmoney = 4,   rewarditem = 'raw_meat' },
    { name = 'Black-Tailed Jackrabbit', model = -541762431,            rewardmoney = 1,   rewarditem = 'raw_meat' },
    { name = 'American Pronghorn Doe', model = 1755643085,             rewardmoney = 1,   rewarditem = 'raw_meat' },
    { name = 'Greater Prairie Chicken', model = 2079703102,            rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Wirginia Possum',       model = -1414989025,             rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'Berkshire Pig',         model = 1007418994,              rewardmoney = 8,   rewarditem = 'raw_meat' },
    { name = 'Ring-Necked Pheasant',  model = 1416324601,              rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'American White Pelican',model = 1265966684,              rewardmoney = 1,   rewarditem = 'large_bird_meat' },
    { name = 'Blue And Yellow Macaw', model = -1797450568,             rewardmoney = 6,   rewarditem = 'bird_meat' },
    { name = 'Panther',               model = 1654513481,              rewardmoney = 70,  rewarditem = 'raw_meat' },
    { name = 'Californian Condor',    model = 1205982615,              rewardmoney = 1,   rewarditem = 'large_bird_meat' },
    { name = 'Dominique Chicken',     model = -2063183075,             rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Double-Crested Cormorant', model = -2073130256,          rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Cougar',                model = 90264823,                rewardmoney = 45,  rewarditem = 'raw_meat' },
    { name = 'Florida Cracker Cow',   model = -50684386,               rewardmoney = 1,   rewarditem = 'raw_meat' },
    { name = 'Coyote',                model = 480688259,               rewardmoney = 8,   rewarditem = 'raw_meat' },
    { name = 'Whooping Crane',        model = -564099192,              rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Gila Monster',          model = 457416415,               rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Alpine Goat',           model = -753902995,              rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'Canada Goose',          model = 723190474,               rewardmoney = 1,   rewarditem = 'bird_meat' },
    { name = 'Ferruinous Hawk',       model = -2145890973,             rewardmoney = 3,   rewarditem = 'bird_meat' },
    { name = 'Great Blue Heron',      model = 1095117488,              rewardmoney = 4,   rewarditem = 'bird_meat' },
    { name = 'Green Iguana',          model = -1854059305,             rewardmoney = 11,  rewarditem = 'raw_meat' },
    { name = 'Desert Iguana',         model = -593056309,              rewardmoney = 11,  rewarditem = 'raw_meat' },
    { name = 'Peccary Pig',           model = 1751700893,              rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'Common Loon',           model = 386506078,               rewardmoney = 19,  rewarditem = 'large_bird_meat' },
    { name = 'Moose',                 model = -1098441944,             rewardmoney = 3,   rewarditem = 'raw_meat' },
    { name = 'American Muskrat',      model = -1134449699,             rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'Great Horned Owl',      model = -861544272,              rewardmoney = 3,   rewarditem = 'large_bird_meat' },
    { name = 'Angus Ox',              model = 556355544,               rewardmoney = 1,   rewarditem = 'raw_meat' },
    { name = 'North American Beaver', model = 759906147,               rewardmoney = 2,   rewarditem = 'raw_meat' },
    { name = 'American Black Bear',   model = 730092646,               rewardmoney = 20,  rewarditem = 'raw_meat' },
    { name = 'Poor Alligator Pelt',   model = -1243878166,             rewardmoney = 5,   rewarditem = 'raw_meat' },
    { name = 'p_cs_pelt_ws_alligator',model = 825523615,               rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Perfect Alligator Pelt',model = -1475338121,             rewardmoney = 12,  rewarditem = 'raw_meat' },
    { name = 'Legendary Alligator Pelt', model = -444893329,           rewardmoney = 15,  rewarditem = 'raw_meat' },
    { name = 'Large alligator',       model = -2004866590,             rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Alligator',             model = -1295720802,             rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Alligator',             model = -1892280447,             rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Alligator',             model = 3360517226,              rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Legendary Moon Beaver', model = -1149999295,             rewardmoney = 20,  rewarditem = 'raw_meat' },
    { name = 'Legendary Maza Cougar', model = -1433814131,             rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Legendary Midnight Paw Coyote', model = -1307757043,     rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Legendary Ghost Panther', model = -1189368951,           rewardmoney = 10,  rewarditem = 'raw_meat' },
    { name = 'Legendary Onyx Wolf',   model = -1392359921,             rewardmoney = 10,  rewarditem = 'raw_meat' },
}

--------------------------------------------------------------------------------
-- FISH VENDOR LOCATIONS
--------------------------------------------------------------------------------
Config.FishVendorLocations = {
    {name = 'St Denis Fish Vendor',   location = 'stdenis-fishvendor',    coords = vector3(2661.7463, -1506.055, 45.968948), model = 'CS_FISHCOLLECTOR', heading = 321.56686, showblip = true},
    {name = 'Valentine Fish Vendor',  location = 'valentine-fishvendor',  coords = vector3(-335.4444, 762.00537, 116.5845), model = 'CS_FISHCOLLECTOR', heading = 45.516292, showblip = true},
    {name = 'Rhodes Fish Vendor',     location = 'rhodes-fishvendor',     coords = vector3(1292.9885, -1273.963, 75.870391), model = 'CS_FISHCOLLECTOR', heading = 181.20063, showblip = true},
    {name = 'Annesburg Fish Vendor',  location = 'annesburg-fishvendor',  coords = vector3(3018.2368, 1352.096, 42.713443), model = 'CS_FISHCOLLECTOR', heading = 23.409223, showblip = true},
    {name = 'Van Horn Fish Vendor',   location = 'vanhorn-fishvendor',    coords = vector3(2991.539, 558.93402, 44.357906), model = 'CS_FISHCOLLECTOR', heading = 4.9385623, showblip = true},
    {name = 'Blackwater Fish Vendor', location = 'blackwater-fishvendor', coords = vector3(-723.9387, -1254.361, 44.734092), model = 'CS_FISHCOLLECTOR', heading = 49.674472, showblip = true},
    {name = 'Tumbleweed Fish Vendor', location = 'tumbleweed-fishvendor', coords = vector3(-5513.404, -2944.167, -2.001027), model = 'CS_FISHCOLLECTOR', heading = 29.520355, showblip = true},
    {name = 'River Fish Vendor',      location = 'river-fishvendor',      coords = vector3(-1452.24, -2684.517, 41.256187), model = 'CS_FISHCOLLECTOR', heading = 221.86631, showblip = true},
}

--------------------------------------------------------------------------------
-- FISH VENDOR PRICES & SHOP
--------------------------------------------------------------------------------
Config.SmallFishPrice = 5
Config.MediumFishPrice = 7
Config.LargeFishPrice = 10

Config.FishVendorShop = {
    { name = "weapon_fishingrod", price = 2,   amount = 500},
    { name = "raw_fish",         price = 2,   amount = 50},
    { name = "p_baitbread01x",   price = 0.25, amount = 5000},
    { name = "p_baitcorn01x",    price = 0.25, amount = 5000},
    { name = "p_baitcheese01x",  price = 0.25, amount = 5000},
    { name = "p_baitworm01x",    price = 0.50, amount = 5000},
    { name = "p_baitcricket01x", price = 0.50, amount = 5000},
    { name = "p_crawdad01x",     price = 0.50, amount = 5000},
    { name = "fishtrap",         price = 25,   amount = 50},
    { name = "trapbait",         price = 1,    amount = 50},
    { name = "fishbasin_ms",     price = 50,   amount = 100},
    { name = "fishbasin_xl",     price = 100,  amount = 100},
}
