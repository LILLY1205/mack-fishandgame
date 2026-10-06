local Translations = {
    error = {
        something_went_wrong = 'something went wrong!',
        dont_have_animal = "don't have an animal on you",
        you_dont_have_any_pelts_to_sell = "you don't have any pelts to sell!",
        you_dont_have_any_carcass_to_sell = "you don't have any Animal Parts to sell!",
        you_dont_have_any_feathers_to_sell = "you don't have any feathers to sell!",
        no_small_fish = 'you don\'t have any small fish to sell!',
        no_medium_fish = 'you don\'t have any medium fish to sell!',
        no_large_fish = 'you don\'t have any large fish to sell!',
        no_money = 'you don\'t have enough money!',
        invalid_quantity = 'invalid quantity!',
    },
    success = {
        you_have_sold_all_your_pelts_for = 'you have sold all your pelts for $',
        you_have_sold_all_your_feathers_for = 'you have sold all your feathers for $',
        you_have_sold_all_your_carcass_for = 'you have sold all your Animal Parts for $',
        small_fish_sold = 'you have sold your small fish for $',
        medium_fish_sold = 'you have sold your medium fish for $',
        large_fish_sold = 'you have sold your large fish for $',
        purchased = 'you have purchased ',
        for_price = ' for $',
    },
    primary = {
        stored = ' Stored',
    },
    menu = {
        open = 'Open ',
        sell_stored_pelts = 'Sell Pelts',
        sell_stored_carcass = 'Sell Animal Parts',
        sell_stored_feathers = 'Sell Feathers',
        sell_animal = 'Sell Animal',
        sell_small_fish = 'Sell Small Fish',
        sell_medium_fish = 'Sell Medium Fish',
        sell_large_fish = 'Sell Large Fish',
        close_menu = 'Close',
        trapper_shop = 'Trapper Shop',
        butcher_shop = 'Butcher Shop',
        fish_shop = 'Fish Vendor Shop',
        price = 'Price',
        instock = 'In Stock',
        buy = 'Buy',
        sell = 'Sell',
        quantity = 'Quantity',
        select_item = 'Select an item to view details',
    },
    progressbar = {
        checking_pelts = 'Checking skins',
        checking_feathers = 'Checking feathers',
        checking_carcass = 'Checking animal remains',
        selling = 'Selling ',
        selling_fish = 'Selling fish',
    },
    blip = {
        trapper = 'Trapper',
        butcher = 'Butcher',
        fishvendor = 'Fish Vendor',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
