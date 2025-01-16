
#> tribe_civilization:advancements/lunar_compass
#
# @within	advancement tribe_civilization:technical/lunar_compass
#

# Revoke advancement
advancement revoke @s only tribe_civilization:technical/lunar_compass

# Effects and feedback
effect give @s blindness 3 0 true
effect give @s slowness 3 1 true
playsound block.beacon.activate ambient @s ~ ~ ~ 1 0.5
tellraw @s {"translate":"tribe_civilization.une_force_mystérieuse_vous_guide_vers_le_temple","color":"aqua"}

# Regive the lunar compass
loot give @s loot tribe_civilization:i/lunar_compass

# Point to temple coordinates (these should match your temple location)
execute at @s facing 4240 100 5664 run tp @s ~ ~ ~ ~ ~

