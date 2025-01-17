
#> tribe_civilization:states/tick_0
#
# @within	tribe_civilization:v1.0.0/tick
#

# Ensure effects
effect give @a[gamemode=!creative] saturation infinite 0 true
effect give @a[gamemode=!creative] regeneration infinite 3 true
effect give @a[gamemode=!creative] weakness infinite 255 true

# Ensure everyone has his ID
execute as @a unless score @s tribe_civilization.id matches 1.. run function tribe_civilization:utils/next_id

