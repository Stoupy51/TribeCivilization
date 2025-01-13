
#> tribe_civilization:advancements/life_crystal
#
# @within	advancement tribe_civilization:technical/life_crystal
#

# Revoke advancement
advancement revoke @s only tribe_civilization:technical/life_crystal

# Increase life crystals score
scoreboard players add @s tribe_civilization.life_crystals 1
execute if score @s tribe_civilization.life_crystals matches 11.. run playsound entity.villager.no ambient @s
execute if score @s tribe_civilization.life_crystals matches 11.. run loot give @s loot tribe_civilization:i/life_crystal
execute if score @s tribe_civilization.life_crystals matches 11.. run tellraw @s [{"translate":"tribe_civilization.vous_ne_pouvez_plus_consommer_de_cristaux_de_vie_vous_avez_attei","color":"red"}]
execute if score @s tribe_civilization.life_crystals matches 11.. run scoreboard players set @s tribe_civilization.life_crystals 10

# Increase health
attribute @s[scores={tribe_civilization.life_crystals=0}] max_health base set 20.0
tellraw @s[scores={tribe_civilization.life_crystals=0}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_0_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=1}] max_health base set 21.0
tellraw @s[scores={tribe_civilization.life_crystals=1}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_1_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=2}] max_health base set 22.0
tellraw @s[scores={tribe_civilization.life_crystals=2}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_2_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=3}] max_health base set 23.0
tellraw @s[scores={tribe_civilization.life_crystals=3}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_3_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=4}] max_health base set 24.0
tellraw @s[scores={tribe_civilization.life_crystals=4}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_4_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=5}] max_health base set 25.0
tellraw @s[scores={tribe_civilization.life_crystals=5}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_5_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=6}] max_health base set 26.0
tellraw @s[scores={tribe_civilization.life_crystals=6}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_6_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=7}] max_health base set 27.0
tellraw @s[scores={tribe_civilization.life_crystals=7}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_7_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=8}] max_health base set 28.0
tellraw @s[scores={tribe_civilization.life_crystals=8}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_8_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=9}] max_health base set 29.0
tellraw @s[scores={tribe_civilization.life_crystals=9}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_9_10","color":"green"}]
attribute @s[scores={tribe_civilization.life_crystals=10}] max_health base set 30.0
tellraw @s[scores={tribe_civilization.life_crystals=10}] [{"translate":"tribe_civilization.vous_avez_mangé_un_cristal_de_vie_10_10","color":"green"}]

