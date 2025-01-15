
#> tribe_civilization:player/tick
#
# @within	tribe_civilization:v1.0.0/tick
#

# Ensure everyone has his ID
execute unless score @s tribe_civilization.id matches 1.. run function tribe_civilization:utils/next_id

# Triggers
scoreboard players enable @s tribe_civilization.trigger
execute unless score @s tribe_civilization.trigger matches 0 run function tribe_civilization:player/trigger

# Particles on death location
execute if score @s tribe_civilization.deathCount matches 1.. run function tribe_civilization:player/particles_on_death_location

# If traitor, loop
execute if entity @s[tag=tribe_civilization.traitor] run function tribe_civilization:player/traitor_loop

