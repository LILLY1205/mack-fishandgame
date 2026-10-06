fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'Mack -  Re-has of combine 3 Scripts with new UI'
description 'mack-fishandgame'

shared_scripts {
    '@rsg-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
    'client/client.lua',
    'client/main.js',
}

server_scripts {
    'server/server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/font/crock.ttf',
    'html/img/clipboard.png',
}

lua54 'yes'
