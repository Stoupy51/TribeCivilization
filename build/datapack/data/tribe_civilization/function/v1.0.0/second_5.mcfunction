
#> tribe_civilization:v1.0.0/second_5
#
# @within	tribe_civilization:v1.0.0/tick
#

# Reset timer
scoreboard players set #second_5 tribe_civilization.data -10

# Seek for new mobs
execute as @e[type=!player,type=!armor_stand,tag=!tribe_civilization.checked,tag=!smithed.entity,tag=!global.ignore,tag=!smithed.strict,tag=!global.ignore.kill] run function tribe_civilization:v1.0.0/mobs/on_new_mob

