
#> tribe_civilization:_setup
#
# @within	???
#

# Reset state
scoreboard players set #state tribe_civilization.data 0

# Define camps zones
tellraw @s [{"translate":"tribe_civilization.veuillez_définir_les_zones_de_camps_suivantes_dans_le_monde","color":"red"}]
tellraw @s [{"text":"- [Tidal Wave]","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_dark_aqua set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [The Golden]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_yellow set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [Dream Flower]","color":"dark_purple","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_purple set value {x: 0, y: 0, z: 0}"}}]
tellraw @s [{"text":"- [Fire in the Hole]","color":"green","clickEvent":{"action":"suggest_command","value":"/data modify storage tribe_civilization:main camp_green set value {x: 0, y: 0, z: 0}"}}]

tellraw @s [{"translate":"tribe_civilization.noubliez_pas","color":"red"}]
tellraw @s [{"translate":"tribe_civilization.les_zones_daventure","color":"red","clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:utils/adventure_zone_add {x: 0, y: 0, z: 0, dx: 0, dy: 0, dz: 0}"}}]
tellraw @s [{"translate":"tribe_civilization.les_heavy_workbench","color":"red","clickEvent":{"action":"suggest_command","value":"/loot give @s loot smithed.crafter:blocks/table"}}]
tellraw @s [{"translate":"tribe_civilization.les_météorites","color":"red","clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:_give_all"}}]

