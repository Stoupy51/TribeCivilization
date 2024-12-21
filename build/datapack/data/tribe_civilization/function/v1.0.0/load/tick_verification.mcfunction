
#> tribe_civilization:v1.0.0/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #tribe_civilization.major load.status matches 1 if score #tribe_civilization.minor load.status matches 0 if score #tribe_civilization.patch load.status matches 0 run function tribe_civilization:v1.0.0/tick

