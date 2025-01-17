
#> tribe_civilization:advancements/inventory_changed
#
# @within	advancement tribe_civilization:technical/inventory_changed
#

# Revoke advancement
advancement revoke @s only tribe_civilization:technical/inventory_changed

## Notify OPs about obtained items
# Map
execute if items entity @s[tag=!tribe_civilization.had_map] container.* filled_map run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_une_map"}]
execute if items entity @s[tag=!tribe_civilization.had_map] container.* filled_map run tag @s add tribe_civilization.had_map


# Life Crystal
execute if items entity @s[tag=!tribe_civilization.had_life_crystal] container.* *[custom_data~{tribe_civilization:{"life_crystal":true}}] run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_un_life_crystal"}]
execute if items entity @s[tag=!tribe_civilization.had_life_crystal] container.* *[custom_data~{tribe_civilization:{"life_crystal":true}}] run tag @s add tribe_civilization.had_life_crystal

# Lunar Compass
execute if items entity @s[tag=!tribe_civilization.had_lunar_compass] container.* *[custom_data~{tribe_civilization:{"lunar_compass":true}}] run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_un_lunar_compass"}]
execute if items entity @s[tag=!tribe_civilization.had_lunar_compass] container.* *[custom_data~{tribe_civilization:{"lunar_compass":true}}] run tag @s add tribe_civilization.had_lunar_compass

# Blood
execute if items entity @s[tag=!tribe_civilization.had_blood] container.* *[custom_data~{tribe_civilization:{"blood":true}}] run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_un_blood"}]
execute if items entity @s[tag=!tribe_civilization.had_blood] container.* *[custom_data~{tribe_civilization:{"blood":true}}] run tag @s add tribe_civilization.had_blood

# Book Of The Beginning
execute if items entity @s[tag=!tribe_civilization.had_book_of_the_beginning] container.* *[custom_data~{tribe_civilization:{"book_of_the_beginning":true}}] run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_un_book_of_the_beginning"}]
execute if items entity @s[tag=!tribe_civilization.had_book_of_the_beginning] container.* *[custom_data~{tribe_civilization:{"book_of_the_beginning":true}}] run tag @s add tribe_civilization.had_book_of_the_beginning

# Book Of The End
execute if items entity @s[tag=!tribe_civilization.had_book_of_the_end] container.* *[custom_data~{tribe_civilization:{"book_of_the_end":true}}] run tellraw @a[team=tribe_civilization.op] [{"selector":"@s"},{"translate":"tribe_civilization.a_obtenu_un_book_of_the_end"}]
execute if items entity @s[tag=!tribe_civilization.had_book_of_the_end] container.* *[custom_data~{tribe_civilization:{"book_of_the_end":true}}] run tag @s add tribe_civilization.had_book_of_the_end

