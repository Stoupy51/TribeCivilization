
#> tribe_civilization:v1.0.0/second
#
# @within	tribe_civilization:v1.0.0/tick
#

# Reset timer
scoreboard players set #second tribe_civilization.data 0

# Each second loop for every adventure zone
tag @a[tag=tribe_civilization.adventure_zone] remove tribe_civilization.adventure_zone
data modify storage tribe_civilization:temp copy set from storage tribe_civilization:main adventure_zones
execute if data storage tribe_civilization:temp copy[0] run function tribe_civilization:utils/adventure_zone_loop with storage tribe_civilization:temp copy[0]
gamemode survival @a[gamemode=adventure,tag=!tribe_civilization.adventure_zone]
gamemode adventure @a[gamemode=survival,tag=tribe_civilization.adventure_zone]

# Each second loop for each player
execute as @a[sort=random] run function tribe_civilization:player/second

