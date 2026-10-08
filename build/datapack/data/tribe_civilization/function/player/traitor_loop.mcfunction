
#> tribe_civilization:player/traitor_loop
#
# @within	tribe_civilization:player/tick
#

# Effects given to the traitor
effect give @s night_vision 1 0 true

# Always saturation if not foodLevel at max for traitors
execute unless data entity @s {foodLevel:20} run effect give @s saturation 1 0 true

