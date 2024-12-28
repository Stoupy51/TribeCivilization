
#> tribe_civilization:setup
#
# @within	???
#

# Reset state
scoreboard players set #state tribe_civilization.data 0

# Define camps zones
tellraw @s [{"text":"Please define the following camps zones in the world:","color":"red"}]
tellraw @s [{"text":"- [Tidal Wave]","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_dark_aqua set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [The Golden]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_yellow set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [Dream Flower]","color":"dark_purple","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_purple set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [Fire in the Hole]","color":"green","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_green set value {x: 0, y: 0, z: 0}"}}]

tellraw @s [{"text":"Don't forget to add [adventure zones]!","color":"red","clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:utils/adventure_zone_add {x: 0, y: 0, z: 0, dx: 0, dy: 0, dz: 0}"}}]

