
#> tribe_civilization:calls/furnace_nbt_recipes/recipes_used
#
# @within	#furnace_nbt_recipes:v1/recipes_used
#

execute if score #found furnace_nbt_recipes.data matches 0 store result score #found furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"components": {"minecraft:custom_data": {"tribe_civilization": {"blue_star": true}}}} run function tribe_civilization:calls/furnace_nbt_recipes/xp_reward/1.0

