
#> tribe_civilization:states/transition_to_2
#
# @within	???
#

# Set state to 2, and default is_not_loyal to 0 (loyal)
scoreboard players set #state tribe_civilization.data 2
scoreboard players set @a[scores={tribe_civilization.is_not_loyal=-1}] tribe_civilization.is_not_loyal 0

# Clear all effects and make black screen fade out
effect clear @a
execute as @a run function tribe_civilization:utils/black_screen_0_40_20

# Join teams
scoreboard players set #next_team tribe_civilization.data 0
execute as @a[gamemode=adventure] run function tribe_civilization:teams/join_team

# Teleportations
data modify storage tribe_civilization:main camp_dark_aqua.team set value "dark_aqua"
data modify storage tribe_civilization:main camp_yellow.team set value "yellow"
data modify storage tribe_civilization:main camp_purple.team set value "purple"
data modify storage tribe_civilization:main camp_green.team set value "green"
function tribe_civilization:teams/teleport with storage tribe_civilization:main camp_dark_aqua
function tribe_civilization:teams/teleport with storage tribe_civilization:main camp_yellow
function tribe_civilization:teams/teleport with storage tribe_civilization:main camp_purple
function tribe_civilization:teams/teleport with storage tribe_civilization:main camp_green
execute as @a at @s run playsound tribe_civilization:starting_round ambient @s

