
#> tribe_civilization:v1.0.0/load/check_dependencies
#
# @within	tribe_civilization:v1.0.0/load/secondary
#

## Check if Tribe Civilization is loadable (dependencies)
scoreboard players set #dependency_error tribe_civilization.data 0
execute if score #dependency_error tribe_civilization.data matches 0 unless score #random_mob_sizes.major load.status matches 1.. run scoreboard players set #dependency_error tribe_civilization.data 1
execute if score #dependency_error tribe_civilization.data matches 0 if score #random_mob_sizes.major load.status matches 1 unless score #random_mob_sizes.minor load.status matches 2.. run scoreboard players set #dependency_error tribe_civilization.data 1
execute if score #dependency_error tribe_civilization.data matches 0 unless score #iyc.major load.status matches 1.. run scoreboard players set #dependency_error tribe_civilization.data 1
execute if score #dependency_error tribe_civilization.data matches 0 if score #iyc.major load.status matches 1 unless score #iyc.minor load.status matches 2.. run scoreboard players set #dependency_error tribe_civilization.data 1

