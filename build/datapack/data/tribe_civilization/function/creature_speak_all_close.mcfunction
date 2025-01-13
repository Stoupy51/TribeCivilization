
#> tribe_civilization:creature_speak_all_close
#
# @within	???
#

$tellraw @a[tag=tribe_civilization.traitor,distance=..100] [{"translate":"tribe_civilization.créature","color":"dark_red"},{"text":"$(msg)"}]
execute as @a[tag=tribe_civilization.traitor,distance=..100] at @s run playsound entity.warden.attack_impact ambient @s

