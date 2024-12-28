
#> tribe_civilization:utils/next_id
#
# @within	tribe_civilization:player/tick
#			tribe_civilization:states/tick_0
#

# Increase previous global ID
scoreboard players add #next_id tribe_civilization.data 1

# Copy next ID to player ID
scoreboard players operation @s tribe_civilization.id = #next_id tribe_civilization.data

# If state is 0 or 1, adventure mode, otherwise spectator mode
execute if score #state tribe_civilization.data matches 0..1 run gamemode adventure @s
execute unless score #state tribe_civilization.data matches 0..1 run gamemode spectator @s

