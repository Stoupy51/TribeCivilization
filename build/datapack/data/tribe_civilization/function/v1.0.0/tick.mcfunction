
#> tribe_civilization:v1.0.0/tick
#
# @within	tribe_civilization:v1.0.0/load/tick_verification
#

# Timers
scoreboard players add #second tribe_civilization.data 1
scoreboard players add #second_5 tribe_civilization.data 1
execute if score #second tribe_civilization.data matches 20.. run function tribe_civilization:v1.0.0/second
execute if score #second_5 tribe_civilization.data matches 90.. run function tribe_civilization:v1.0.0/second_5

