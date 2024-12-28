
#> tribe_civilization:start
#
# @within	???
#

# TODO: add functionality
# Update state
scoreboard players set #state tribe_civilization.data 1

# Set is_not_loyal to -1 for all players that are not in creative mode to ask them in the next state
scoreboard players set @a[gamemode=adventure] tribe_civilization.is_not_loyal -1
tellraw @a[gamemode=adventure] [{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nQuestion simple : Voulez-vous être loyal à votre tribu ?", "color":"aqua"}]
tellraw @a[gamemode=adventure] [{"text":"[Je le serais]", "color":"green","clickEvent":{"action":"run_command","value":"/trigger tribe_civilization.trigger set 1"},"hoverEvent":{"action":"show_text","value":"Ma tribu peut compter sur moi !"}},{"text":" | ","color":"gray"},{"text":"[Hell nah]", "color":"red","clickEvent":{"action":"run_command","value":"/trigger tribe_civilization.trigger set 2"},"hoverEvent":{"action":"show_text","value":"Dis moi en plus !"}}]








