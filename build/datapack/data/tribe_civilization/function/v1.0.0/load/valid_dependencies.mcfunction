
#> tribe_civilization:v1.0.0/load/valid_dependencies
#
# @within	tribe_civilization:v1.0.0/load/secondary
#			tribe_civilization:v1.0.0/load/valid_dependencies 1t replace
#

# Waiting for a player to get the game version, but stop function if no player found
execute unless entity @p run schedule function tribe_civilization:v1.0.0/load/valid_dependencies 1t replace
execute unless entity @p run return 0
execute store result score #game_version tribe_civilization.data run data get entity @p DataVersion

# Check if the game version is supported
scoreboard players set #mcload_error tribe_civilization.data 0
execute unless score #game_version tribe_civilization.data matches 4082.. run scoreboard players set #mcload_error tribe_civilization.data 1

# Decode errors
execute if score #mcload_error tribe_civilization.data matches 1 run tellraw @a {"text":"Tribe Civilization Error: This version is made for Minecraft 1.21.4+.","color":"red"}
execute if score #dependency_error tribe_civilization.data matches 1 run tellraw @a {"text":"Tribe Civilization Error: Libraries are missing\nplease download the right Tribe Civilization datapack\nor download each of these libraries one by one:","color":"red"}
execute if score #dependency_error tribe_civilization.data matches 1 unless score #smithed.crafter.major load.status matches 0.. run tellraw @a {"text":"- [Smithed Crafter (v0.6.2+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 6.. run tellraw @a {"text":"- [Smithed Crafter (v0.6.2+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #smithed.crafter.major load.status matches 0 if score #smithed.crafter.minor load.status matches 6 unless score #smithed.crafter.patch load.status matches 2.. run tellraw @a {"text":"- [Smithed Crafter (v0.6.2+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error tribe_civilization.data matches 1 unless score #random_mob_sizes.major load.status matches 1.. run tellraw @a {"text":"- [RandomMobSizes (v1.2.0+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/random-mob-sizes-dp"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #random_mob_sizes.major load.status matches 1 unless score #random_mob_sizes.minor load.status matches 2.. run tellraw @a {"text":"- [RandomMobSizes (v1.2.0+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/random-mob-sizes-dp"}}
execute if score #dependency_error tribe_civilization.data matches 1 unless score #iyc.major load.status matches 0.. run tellraw @a {"text":"- [ImagineYourCraft (v0.0.1+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #iyc.major load.status matches 0 unless score #iyc.minor load.status matches 0.. run tellraw @a {"text":"- [ImagineYourCraft (v0.0.1+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #iyc.major load.status matches 0 if score #iyc.minor load.status matches 0 unless score #iyc.patch load.status matches 1.. run tellraw @a {"text":"- [ImagineYourCraft (v0.0.1+)]","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}

# Load Tribe Civilization
execute if score #game_version tribe_civilization.data matches 1.. if score #mcload_error tribe_civilization.data matches 0 if score #dependency_error tribe_civilization.data matches 0 run function tribe_civilization:v1.0.0/load/confirm_load

