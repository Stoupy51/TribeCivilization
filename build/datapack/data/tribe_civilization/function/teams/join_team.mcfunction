
#> tribe_civilization:teams/join_team
#
# @within	tribe_civilization:states/transition_to_2
#

# Join team
execute if score #next_team tribe_civilization.data matches 0 run team join tribe_civilization.dark_aqua @s
execute if score #next_team tribe_civilization.data matches 1 run team join tribe_civilization.yellow @s
execute if score #next_team tribe_civilization.data matches 2 run team join tribe_civilization.purple @s
execute if score #next_team tribe_civilization.data matches 3 run team join tribe_civilization.green @s

# Colored leather helmet
execute if score #next_team tribe_civilization.data matches 0 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=18803]
execute if score #next_team tribe_civilization.data matches 1 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=13224192]
execute if score #next_team tribe_civilization.data matches 2 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=6422691]
execute if score #next_team tribe_civilization.data matches 3 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=26880]

# Increment next team (modulo 4)
scoreboard players add #next_team tribe_civilization.data 1
execute if score #next_team tribe_civilization.data matches 4 run scoreboard players set #next_team tribe_civilization.data 0

