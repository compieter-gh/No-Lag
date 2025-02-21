import ../../../macros/log.mcm


function distance {
    execute if score $noAIDistance nola.config matches 42 run {
        execute if entity @s[tag=!nola.noAI,tag=!nola.noAI.ignore] unless entity @p[gamemode=!spectator,distance=..42] run function nola:modules/no_ai/enable
        execute if entity @s[tag=nola.noAI] if entity @p[gamemode=!spectator,distance=..42] run function nola:modules/no_ai/disable
    }
    execute if score $noAIDistance nola.config matches 64 run {
        execute if entity @s[tag=!nola.noAI,tag=!nola.noAI.ignore] unless entity @p[gamemode=!spectator,distance=..64] run function nola:modules/no_ai/enable
        execute if entity @s[tag=nola.noAI] if entity @p[gamemode=!spectator,distance=..64] run function nola:modules/no_ai/disable
    }
    execute if score $noAIDistance nola.config matches 86 run {
        execute if entity @s[tag=!nola.noAI,tag=!nola.noAI.ignore] unless entity @p[gamemode=!spectator,distance=..86] run function nola:modules/no_ai/enable
        execute if entity @s[tag=nola.noAI] if entity @p[gamemode=!spectator,distance=..86] run function nola:modules/no_ai/disable
    }
    execute if entity @s[tag=nola.noAI.ignore,tag=nola.noAI] run function nola:modules/no_ai/disable
}


function enable {
    tag @s add nola.noAI
    log NoLag debug entity <Disabled AI>

    data merge entity @s {NoAI: 1b, Invulnerable: 1b}
}

function disable {
    tag @s remove nola.noAI
    log NoLag debug entity <Enabled AI>

    data merge entity @s {NoAI: 0b, Invulnerable: 0b}
}


entities ignore {
    minecraft:player

    minecraft:wither
    minecraft:ender_dragon
    minecraft:elder_guardian

    minecraft:armor_stand
    minecraft:area_effect_cloud

    minecraft:ghast
    minecraft:phantom
    minecraft:trader_llama
    minecraft:wandering_trader
    minecraft:allay
}
