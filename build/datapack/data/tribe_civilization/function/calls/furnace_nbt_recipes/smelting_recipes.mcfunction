
#> tribe_civilization:calls/furnace_nbt_recipes/smelting_recipes
#
# @within	#furnace_nbt_recipes:v1/smelting_recipes
#

execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"tribe_civilization": {"blue_star": true}}}} run loot replace block ~ ~ ~ container.3 loot tribe_civilization:i/astral_powder_x2

