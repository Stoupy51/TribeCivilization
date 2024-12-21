
#> tribe_civilization:v1.0.0/load/enumerate
#
# @within	#tribe_civilization:enumerate
#

# If current major is too low, set it to the current major
execute unless score #tribe_civilization.major load.status matches 1.. run scoreboard players set #tribe_civilization.major load.status 1

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #tribe_civilization.major load.status matches 1 unless score #tribe_civilization.minor load.status matches 0.. run scoreboard players set #tribe_civilization.minor load.status 0

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #tribe_civilization.major load.status matches 1 if score #tribe_civilization.minor load.status matches 0 unless score #tribe_civilization.patch load.status matches 0.. run scoreboard players set #tribe_civilization.patch load.status 0

