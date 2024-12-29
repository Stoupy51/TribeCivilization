
#> tribe_civilization:player/particles_on_death_location
#
# @within	tribe_civilization:player/tick
#

# Get death location
data modify storage tribe_civilization:temp death_location set value {dimension:"",x:0,y:0,z:0}
data modify storage tribe_civilization:temp death_location.dimension set from entity @s LastDeathLocation.dimension
data modify storage tribe_civilization:temp death_location.x set from entity @s LastDeathLocation.pos[0]
data modify storage tribe_civilization:temp death_location.y set from entity @s LastDeathLocation.pos[1]
data modify storage tribe_civilization:temp death_location.z set from entity @s LastDeathLocation.pos[2]

# Game over sound
execute at @s run playsound tribe_civilization:game_over ambient @s

# Particles and playsound, reset death count, and make sure spectator mode
function tribe_civilization:player/on_death_location_macro with storage tribe_civilization:temp death_location
scoreboard players reset @s tribe_civilization.deathCount
gamemode spectator @s

