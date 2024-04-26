-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || FX-Manifest
-- ════════════════════════════════════════════════════════════════════════════════════ --
fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }

author 'Trusted-Development | R* Editor Clip Handler Script'
description 'R* Editor Clip Handler Script made by GMW'
repository 'https://trusted.tebex.io'
version '2.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}