
#> tribe_civilization:states/tick_0
#
# @within	tribe_civilization:v1.0.0/tick
#

# Ensure effects
effect give @a saturation infinite 0 true
effect give @a regeneration infinite 3 true

# Ensure everyone has his ID
execute as @a unless score @s tribe_civilization.id matches 1.. run function tribe_civilization:utils/next_id

