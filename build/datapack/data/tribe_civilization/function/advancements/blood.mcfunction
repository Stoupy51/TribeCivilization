
#> tribe_civilization:advancements/blood
#
# @within	advancement tribe_civilization:technical/consumed_blood
#

# Revoke advancement
advancement revoke @s only tribe_civilization:technical/consumed_blood

# Join traitor team
tag @s add tribe_civilization.traitor
team join tribe_civilization.red @s

# Tell the team the coordinates
execute store result score #x tribe_civilization.data run data get entity @s Pos[0]
execute store result score #y tribe_civilization.data run data get entity @s Pos[0]
execute store result score #z tribe_civilization.data run data get entity @s Pos[0]
tellraw @a[tag=tribe_civilization.traitor] [{"selector":"@s"},{"translate":"tribe_civilization.vient_de_se_transformer_position__x"},{"score":{"objective":"tribe_civilization.data","name":"#x"}},{"text":", y="},{"score":{"objective":"tribe_civilization.data","name":"#y"}},{"text":", z="},{"score":{"objective":"tribe_civilization.data","name":"#z"}}]

# Summon lightning bolt
summon lightning_bolt ~ ~-10 ~

# Summon particles and play sound
particle sonic_boom ~ ~1 ~ 1 1 1 0 25 force @a[distance=..100]
playsound entity.warden.sonic_boom ambient @a[distance=..100]

# Equip horns
loot replace entity @s armor.head loot tribe_civilization:i/small_horns
item modify entity @s armor.head tribe_civilization:turn_into_small_horns

# Absorption
effect give @s absorption 240 4 true

