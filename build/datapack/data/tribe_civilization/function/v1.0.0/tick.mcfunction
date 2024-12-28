
#> tribe_civilization:v1.0.0/tick
#
# @within	tribe_civilization:v1.0.0/load/tick_verification
#

# Timers
scoreboard players add #second tribe_civilization.data 1
scoreboard players add #second_5 tribe_civilization.data 1
execute if score #second tribe_civilization.data matches 20.. run function tribe_civilization:v1.0.0/second
execute if score #second_5 tribe_civilization.data matches 90.. run function tribe_civilization:v1.0.0/second_5

# Each tick loop for each player
execute as @a[sort=random] run function tribe_civilization:player/tick

# Tick function for state 0
execute if score #state tribe_civilization.data matches 0 run function tribe_civilization:states/tick_0

# Tick function for state 1
execute if score #state tribe_civilization.data matches 1 run function tribe_civilization:states/tick_1

# Tick function for state 2 (that will always be active)
execute if score #state tribe_civilization.data matches 2.. run function tribe_civilization:states/tick_2

# Tick function for state 3
execute if score #state tribe_civilization.data matches 3 run function tribe_civilization:states/tick_3

# Tick function for state 4
execute if score #state tribe_civilization.data matches 4 run function tribe_civilization:states/tick_4

