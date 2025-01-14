
#> tribe_civilization:states/transition_to_3
#
# @within	???
#

# Set state to 3
scoreboard players set #state tribe_civilization.data 3

# Create bossbar
bossbar add tribe_civilization:creature_bar [{"translate":"tribe_civilization.bloodlust","color":"red"}]
bossbar set tribe_civilization:creature_bar color red
bossbar set tribe_civilization:creature_bar max 1000
bossbar set tribe_civilization:creature_bar value 1000
bossbar set tribe_civilization:creature_bar visible true
bossbar set tribe_civilization:creature_bar style notched_6

# Playsound and border
execute at @e[tag=tribe_civilization.creature] run playsound entity.warden.emerge ambient @a ~ ~ ~ 10000 0.8 1
worldborder set 500 2700

