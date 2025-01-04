
#> tribe_civilization:falling_stars/tick
#
# @within	tribe_civilization:v1.0.0/tick
#

# If last tick, kill the falling stars
execute if score #daytime tribe_civilization.data matches 23000 as @e[type=item] if data entity @s Item.components."minecraft:custom_data".tribe_civilization.blue_star run kill @s
execute if score #daytime tribe_civilization.data matches 23000 run kill @e[tag=tribe_civilization.falling_star]

# For each alive player, if they are on surface, spawn a falling star with probability
execute as @a[gamemode=!spectator,predicate=tribe_civilization:chance/0.01] at @s positioned over world_surface if entity @s[distance=..5] summon item_display run function tribe_civilization:falling_stars/summon

# Tick function for each falling star
execute as @e[tag=tribe_civilization.falling_star] at @s run function tribe_civilization:falling_stars/entity_tick

