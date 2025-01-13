
#> tribe_civilization:advancements/life_crystal
#
# @within	advancement tribe_civilization:technical/life_crystal
#

# Revoke advancement
advancement revoke @s only tribe_civilization:technical/life_crystal

# Increase life crystals score
scoreboard players add @s tribe_civilization.life_crystals 1
execute if score @s tribe_civilization.life_crystals matches 10.. run playsound entity.villager.no ambient @s
execute if score @s tribe_civilization.life_crystals matches 10.. run loot give @s loot tribe_civilization:i/life_crystal
execute if score @s tribe_civilization.life_crystals matches 10.. run tellraw @s [{"translate":"tribe_civilization.vous_ne_pouvez_plus_consommer_de_cristaux_de_vie_vous_avez_attei","color":"red"}]
execute if score @s tribe_civilization.life_crystals matches 10.. run scoreboard players set @s tribe_civilization.life_crystals 10

# Increase health
attribute @s[scores={tribe_civilization.life_crystals=0}] max_health base set 20.0
attribute @s[scores={tribe_civilization.life_crystals=1}] max_health base set 21.0
attribute @s[scores={tribe_civilization.life_crystals=2}] max_health base set 22.0
attribute @s[scores={tribe_civilization.life_crystals=3}] max_health base set 23.0
attribute @s[scores={tribe_civilization.life_crystals=4}] max_health base set 24.0
attribute @s[scores={tribe_civilization.life_crystals=5}] max_health base set 25.0
attribute @s[scores={tribe_civilization.life_crystals=6}] max_health base set 26.0
attribute @s[scores={tribe_civilization.life_crystals=7}] max_health base set 27.0
attribute @s[scores={tribe_civilization.life_crystals=8}] max_health base set 28.0
attribute @s[scores={tribe_civilization.life_crystals=9}] max_health base set 29.0
attribute @s[scores={tribe_civilization.life_crystals=10}] max_health base set 30.0

