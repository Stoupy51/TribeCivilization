
#> tribe_civilization:advancements/unlock_recipes
#
# @within	advancement tribe_civilization:unlock_recipes
#

# Revoke advancement
advancement revoke @s only tribe_civilization:unlock_recipes

## For each ingredient in inventory, unlock the recipes
# minecraft:gold_ingot
scoreboard players set #success tribe_civilization.data 0
execute store success score #success tribe_civilization.data if items entity @s container.* minecraft:gold_ingot
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish_2
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish_3

# minecraft:cod
scoreboard players set #success tribe_civilization.data 0
execute store success score #success tribe_civilization.data if items entity @s container.* minecraft:cod
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish

# minecraft:salmon
scoreboard players set #success tribe_civilization.data 0
execute store success score #success tribe_civilization.data if items entity @s container.* minecraft:salmon
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish_2

# minecraft:tropical_fish
scoreboard players set #success tribe_civilization.data 0
execute store success score #success tribe_civilization.data if items entity @s container.* minecraft:tropical_fish
execute if score #success tribe_civilization.data matches 1 run recipe give @s tribe_civilization:gold_fish_3

## Add result items
execute if items entity @s container.* *[custom_data~{"tribe_civilization": {"gold_fish":true} }] run recipe give @s tribe_civilization:gold_fish
execute if items entity @s container.* *[custom_data~{"tribe_civilization": {"gold_fish":true} }] run recipe give @s tribe_civilization:gold_fish_2
execute if items entity @s container.* *[custom_data~{"tribe_civilization": {"gold_fish":true} }] run recipe give @s tribe_civilization:gold_fish_3

