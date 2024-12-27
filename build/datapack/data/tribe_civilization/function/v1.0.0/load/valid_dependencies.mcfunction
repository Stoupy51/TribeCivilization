
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
execute if score #mcload_error tribe_civilization.data matches 1 run tellraw @a {"translate":"tribe_civilization_error_this_version_is_made_for_minecraft_1_21","color":"red"}
execute if score #dependency_error tribe_civilization.data matches 1 run tellraw @a {"translate":"tribe_civilization_error_libraries_are_missingplease_download_th","color":"red"}
execute if score #dependency_error tribe_civilization.data matches 1 unless score #random_mob_sizes.major load.status matches 1.. run tellraw @a {"translate":"tribe_civilization.randommobsizes_v1_2_0","color":"gold","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/random-mob-sizes-dp"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #random_mob_sizes.major load.status matches 1 unless score #random_mob_sizes.minor load.status matches 2.. run tellraw @a {"translate":"tribe_civilization.randommobsizes_v1_2_0","color":"gold","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/random-mob-sizes-dp"}}
execute if score #dependency_error tribe_civilization.data matches 1 unless score #iyc.major load.status matches 0.. run tellraw @a {"translate":"tribe_civilization.imagineyourcraft_v0_0_1","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #iyc.major load.status matches 0 unless score #iyc.minor load.status matches 0.. run tellraw @a {"translate":"tribe_civilization.imagineyourcraft_v0_0_1","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}
execute if score #dependency_error tribe_civilization.data matches 1 if score #iyc.major load.status matches 0 if score #iyc.minor load.status matches 0 unless score #iyc.patch load.status matches 1.. run tellraw @a {"translate":"tribe_civilization.imagineyourcraft_v0_0_1","color":"gold","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/ImagineYourCraft"}}

# Load Tribe Civilization
execute if score #game_version tribe_civilization.data matches 1.. if score #mcload_error tribe_civilization.data matches 0 if score #dependency_error tribe_civilization.data matches 0 run function tribe_civilization:v1.0.0/load/confirm_load

