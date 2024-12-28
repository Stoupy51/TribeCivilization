
#> tribe_civilization:player/tick
#
# @within	tribe_civilization:v1.0.0/tick
#

# Triggers
scoreboard players enable @s tribe_civilization.trigger
execute unless score @s tribe_civilization.trigger matches 0 run function tribe_civilization:player/trigger

# Particles on death location
execute if score @s tribe_civilization.deathCount matches 1.. run function tribe_civilization:player/particles_on_death_location

