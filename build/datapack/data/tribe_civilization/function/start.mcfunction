
#> tribe_civilization:start
#
# @within	???
#

# Update state and game total time
scoreboard players set #state tribe_civilization.data 1
scoreboard players set #game_total_time tribe_civilization.data 0
execute as @a run function tribe_civilization:utils/black_screen_20_40_0
team join tribe_civilization.op @a[gamemode=creative]

# Clear all & effects
effect clear @a[gamemode=adventure]
clear @a[gamemode=adventure]

# Set is_not_loyal to -1 for all players that are not in creative mode to ask them in the next state
scoreboard players set @a[gamemode=adventure] tribe_civilization.is_not_loyal -1
tellraw @a[gamemode=adventure] [{"translate":"tribe_civilization.question_simple__voulez_vous_être_loyal_à_votre_tribu", "color":"aqua"}]
tellraw @a[gamemode=adventure] [{"translate":"tribe_civilization.je_le_serais", "color":"green","clickEvent":{"action":"run_command","value":"/trigger tribe_civilization.trigger set 1"},"hoverEvent":{"action":"show_text","value":"Ma tribu peut compter sur moi !"}},{"text":" | ","color":"gray"},{"translate":"tribe_civilization.hell_nah", "color":"red","clickEvent":{"action":"run_command","value":"/trigger tribe_civilization.trigger set 2"},"hoverEvent":{"action":"show_text","value":"Dis moi en plus !"}}]

