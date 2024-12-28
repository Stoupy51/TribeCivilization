
#> tribe_civilization:player/trigger
#
# @within	tribe_civilization:player/tick
#

# TODO: add functionality
# State 1 vote (loyal or not)
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1 run scoreboard players set @s tribe_civilization.is_not_loyal 0
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 2 run scoreboard players set @s tribe_civilization.is_not_loyal 1
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1 run tellraw @s [{"text":"Votre souhait d'être loyal a été pris en compte !", "color":"green"}]
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 2 run tellraw @s [{"text":"Votre souhait de ne pas être loyal a été pris en compte !", "color":"red"}]
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1..2 run playsound ui.button.click

# Reset trigger
scoreboard players set @s tribe_civilization.trigger 0

