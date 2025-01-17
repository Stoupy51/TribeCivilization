
#> tribe_civilization:teams/parachute
#
# @within	???
#

# Join team
function tribe_civilization:teams/join_team
tag @s add tribe_civilization.parachute

# Launch parachute at right position
execute if entity @s[team=tribe_civilization.dark_aqua] summon chicken run function tribe_civilization:teams/parachute_macro with storage tribe_civilization:main camp_dark_aqua
execute if entity @s[team=tribe_civilization.yellow] summon chicken run function tribe_civilization:teams/parachute_macro with storage tribe_civilization:main camp_yellow
execute if entity @s[team=tribe_civilization.purple] summon chicken run function tribe_civilization:teams/parachute_macro with storage tribe_civilization:main camp_purple
execute if entity @s[team=tribe_civilization.green] summon chicken run function tribe_civilization:teams/parachute_macro with storage tribe_civilization:main camp_green
tag @s remove tribe_civilization.parachute

