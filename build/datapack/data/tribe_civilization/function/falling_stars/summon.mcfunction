
#> tribe_civilization:falling_stars/summon
#
# @within	tribe_civilization:falling_stars/tick
#

# Add tags
tag @s add tribe_civilization.falling_star
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill

# Take a random position
execute at @s run spreadplayers ~ ~ 0 5 false @s

# Define initial position and scale, and playsound
playsound tribe_civilization:falling_star ambient @a[distance=..20]
data modify entity @s transformation.translation set value [20.0f, 15.0f, 0.0f]
data modify entity @s transformation.left_rotation set value {angle:0.0f,axis:[0.0f,0.0f,1.0f]}
data modify entity @s transformation.scale set value [0.8f, 0.8f, 0.8f]
scoreboard players set @s tribe_civilization.timer 0

# Random rotation
execute store result entity @s Rotation[0] float 1 run random value -8..8
execute store result entity @s Rotation[1] float 1 run random value -8..8

# Add item
loot replace entity @s contents loot tribe_civilization:i/blue_star

