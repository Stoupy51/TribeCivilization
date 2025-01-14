
#> tribe_civilization:states/tick_2
#
# @within	tribe_civilization:v1.0.0/tick
#

# Always saturation if not foodLevel at max for traitors
execute as @a[tag=tribe_civilization.traitor] unless data entity @s {foodLevel:20} run effect give @s saturation 1 0 true

# Join traitor team for every entity
team join tribe_civilization.red @e[type=!player,type=!wolf,team=!tribe_civilization.red]

# Control entity as OP
execute as @a[gamemode=creative,team=tribe_civilization.op] at @s run function tribe_civilization:entity/control_nearest

