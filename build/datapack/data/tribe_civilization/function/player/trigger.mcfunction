
#> tribe_civilization:player/trigger
#
# @within	tribe_civilization:player/tick
#

# TODO: add functionality
# State 1 vote (loyal or not)
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1 run scoreboard players set @s tribe_civilization.is_not_loyal 0
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 2 run scoreboard players set @s tribe_civilization.is_not_loyal 1
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1 run tellraw @s [{"translate":"tribe_civilization.votre_souhait_dêtre_loyal_a_été_pris_en_compte", "color":"green"}]
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 2 run tellraw @s [{"translate":"tribe_civilization.votre_souhait_de_ne_pas_être_loyal_a_été_pris_en_compte", "color":"red"}]
execute if score #state tribe_civilization.data matches 1 if score @s tribe_civilization.trigger matches 1..2 run playsound ui.button.click

# Reset trigger
scoreboard players set @s tribe_civilization.trigger 0

