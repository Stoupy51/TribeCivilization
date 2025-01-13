
#> tribe_civilization:states/tick_2
#
# @within	tribe_civilization:v1.0.0/tick
#

# TODO: add functionality

# Always saturation if not foodLevel at max for traitors
execute as @a[tag=tribe_civilization.traitor] unless data entity @s {foodLevel:20} run effect give @s saturation 1 0 true

# Control entity as OP
execute as @a[gamemode=creative,team=tribe_civilization.op] at @s run function tribe_civilization:entity/control_nearest

