
#> tribe_civilization:falling_stars/entity_tick
#
# @within	tribe_civilization:falling_stars/tick
#

# Movement forward
scoreboard players add @s tribe_civilization.timer 1
execute if score @s tribe_civilization.timer matches 2 run data merge entity @s {transformation:{left_rotation:{angle:-180.0f,axis:[0.0f,0.0f,1.0f]},translation:[0.0f, 0.0f, 0.0f]},interpolation_duration:30,start_interpolation:0}
execute if score @s tribe_civilization.timer matches 0 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~20.0 ~15.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 1 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~19.333333333333332 ~14.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 2 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~18.666666666666668 ~14.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 3 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~18.0 ~13.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 4 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~17.333333333333332 ~13.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 5 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~16.666666666666668 ~12.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 6 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~16.0 ~12.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 7 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~15.333333333333334 ~11.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 8 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~14.666666666666668 ~11.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 9 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~14.0 ~10.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 10 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~13.333333333333334 ~10.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 11 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~12.666666666666668 ~9.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 12 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~12.0 ~9.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 13 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~11.333333333333334 ~8.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 14 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~10.666666666666668 ~8.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 15 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~10.0 ~7.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 16 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~9.333333333333334 ~7.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 17 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~8.666666666666668 ~6.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 18 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~8.0 ~6.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 19 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~7.333333333333334 ~5.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 20 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~6.666666666666668 ~5.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 21 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~6.0 ~4.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 22 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~5.333333333333334 ~4.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 23 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~4.666666666666668 ~3.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 24 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~4.0 ~3.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 25 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~3.3333333333333357 ~2.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 26 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~2.666666666666668 ~2.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 27 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~2.0 ~1.5 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 28 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~1.3333333333333357 ~1.0 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s tribe_civilization.timer matches 29 run particle dust{color:[0.0,0.0,1.0],scale:0.5} ~0.6666666666666679 ~0.5 ~ 0.5 0.5 0.5 0 25 normal


# Action when hitting the ground
execute if score @s tribe_civilization.timer matches 30.. if predicate tribe_civilization:chance/0.1 run function tribe_civilization:falling_stars/drop
execute if score @s tribe_civilization.timer matches 30.. run kill @s

