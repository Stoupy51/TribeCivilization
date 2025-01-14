
#> tribe_civilization:states/creature_tick
#
# @within	tribe_civilization:states/tick_3
#

# Bossbar to all traitors and players in range
tag @a[tag=tribe_civilization.traitor] add tribe_civilization.creature_bar
tag @a[distance=..200] add tribe_civilization.creature_bar
bossbar set tribe_civilization:creature_bar players @a[tag=tribe_civilization.creature_bar]
tag @a[tag=tribe_civilization.creature_bar] remove tribe_civilization.creature_bar

# Update bossbar value
execute store result score #health tribe_civilization.data run data get entity @s Health
execute store result bossbar tribe_civilization:creature_bar value run scoreboard players get #health tribe_civilization.data

# Update entity size depending on health
execute if score #health tribe_civilization.data matches 0..5 run attribute @s scale base set 0.5
execute if score #health tribe_civilization.data matches 5..10 run attribute @s scale base set 0.535
execute if score #health tribe_civilization.data matches 10..15 run attribute @s scale base set 0.5700000000000001
execute if score #health tribe_civilization.data matches 15..20 run attribute @s scale base set 0.605
execute if score #health tribe_civilization.data matches 20..25 run attribute @s scale base set 0.64
execute if score #health tribe_civilization.data matches 25..30 run attribute @s scale base set 0.675
execute if score #health tribe_civilization.data matches 30..34 run attribute @s scale base set 0.71
execute if score #health tribe_civilization.data matches 35..40 run attribute @s scale base set 0.745
execute if score #health tribe_civilization.data matches 40..45 run attribute @s scale base set 0.78
execute if score #health tribe_civilization.data matches 45..49 run attribute @s scale base set 0.815
execute if score #health tribe_civilization.data matches 50..55 run attribute @s scale base set 0.8500000000000001
execute if score #health tribe_civilization.data matches 55..60 run attribute @s scale base set 0.885
execute if score #health tribe_civilization.data matches 60..65 run attribute @s scale base set 0.9199999999999999
execute if score #health tribe_civilization.data matches 65..70 run attribute @s scale base set 0.9550000000000001
execute if score #health tribe_civilization.data matches 70..75 run attribute @s scale base set 0.99
execute if score #health tribe_civilization.data matches 75..80 run attribute @s scale base set 1.025
execute if score #health tribe_civilization.data matches 80..85 run attribute @s scale base set 1.06
execute if score #health tribe_civilization.data matches 85..90 run attribute @s scale base set 1.0950000000000002
execute if score #health tribe_civilization.data matches 90..95 run attribute @s scale base set 1.13
execute if score #health tribe_civilization.data matches 95..100 run attribute @s scale base set 1.165
execute if score #health tribe_civilization.data matches 100..105 run attribute @s scale base set 1.2000000000000002
execute if score #health tribe_civilization.data matches 105..110 run attribute @s scale base set 1.2349999999999999
execute if score #health tribe_civilization.data matches 110..115 run attribute @s scale base set 1.27
execute if score #health tribe_civilization.data matches 115..120 run attribute @s scale base set 1.3050000000000002
execute if score #health tribe_civilization.data matches 120..125 run attribute @s scale base set 1.3399999999999999
execute if score #health tribe_civilization.data matches 125..130 run attribute @s scale base set 1.375
execute if score #health tribe_civilization.data matches 130..135 run attribute @s scale base set 1.4100000000000001
execute if score #health tribe_civilization.data matches 135..140 run attribute @s scale base set 1.445
execute if score #health tribe_civilization.data matches 140..145 run attribute @s scale base set 1.48
execute if score #health tribe_civilization.data matches 145..150 run attribute @s scale base set 1.515
execute if score #health tribe_civilization.data matches 150..155 run attribute @s scale base set 1.55
execute if score #health tribe_civilization.data matches 155..160 run attribute @s scale base set 1.585
execute if score #health tribe_civilization.data matches 160..165 run attribute @s scale base set 1.62
execute if score #health tribe_civilization.data matches 165..170 run attribute @s scale base set 1.655
execute if score #health tribe_civilization.data matches 170..175 run attribute @s scale base set 1.6900000000000002
execute if score #health tribe_civilization.data matches 175..180 run attribute @s scale base set 1.7249999999999999
execute if score #health tribe_civilization.data matches 180..185 run attribute @s scale base set 1.76
execute if score #health tribe_civilization.data matches 185..190 run attribute @s scale base set 1.795
execute if score #health tribe_civilization.data matches 190..195 run attribute @s scale base set 1.83
execute if score #health tribe_civilization.data matches 195..200 run attribute @s scale base set 1.865
execute if score #health tribe_civilization.data matches 200..205 run attribute @s scale base set 1.9000000000000001
execute if score #health tribe_civilization.data matches 205..210 run attribute @s scale base set 1.9349999999999998
execute if score #health tribe_civilization.data matches 210..215 run attribute @s scale base set 1.97
execute if score #health tribe_civilization.data matches 215..220 run attribute @s scale base set 2.005
execute if score #health tribe_civilization.data matches 220..225 run attribute @s scale base set 2.04
execute if score #health tribe_civilization.data matches 225..230 run attribute @s scale base set 2.075
execute if score #health tribe_civilization.data matches 230..235 run attribute @s scale base set 2.1100000000000003
execute if score #health tribe_civilization.data matches 235..240 run attribute @s scale base set 2.145
execute if score #health tribe_civilization.data matches 240..245 run attribute @s scale base set 2.1799999999999997
execute if score #health tribe_civilization.data matches 245..250 run attribute @s scale base set 2.215
execute if score #health tribe_civilization.data matches 250..255 run attribute @s scale base set 2.25
execute if score #health tribe_civilization.data matches 255..260 run attribute @s scale base set 2.285
execute if score #health tribe_civilization.data matches 260..265 run attribute @s scale base set 2.3200000000000003
execute if score #health tribe_civilization.data matches 265..270 run attribute @s scale base set 2.355
execute if score #health tribe_civilization.data matches 270..275 run attribute @s scale base set 2.39
execute if score #health tribe_civilization.data matches 275..280 run attribute @s scale base set 2.4250000000000003
execute if score #health tribe_civilization.data matches 280..285 run attribute @s scale base set 2.46
execute if score #health tribe_civilization.data matches 285..290 run attribute @s scale base set 2.495
execute if score #health tribe_civilization.data matches 290..295 run attribute @s scale base set 2.53
execute if score #health tribe_civilization.data matches 295..300 run attribute @s scale base set 2.565
execute if score #health tribe_civilization.data matches 300..305 run attribute @s scale base set 2.6
execute if score #health tribe_civilization.data matches 305..310 run attribute @s scale base set 2.635
execute if score #health tribe_civilization.data matches 310..315 run attribute @s scale base set 2.67
execute if score #health tribe_civilization.data matches 315..320 run attribute @s scale base set 2.705
execute if score #health tribe_civilization.data matches 320..325 run attribute @s scale base set 2.74
execute if score #health tribe_civilization.data matches 325..330 run attribute @s scale base set 2.775
execute if score #health tribe_civilization.data matches 330..335 run attribute @s scale base set 2.81
execute if score #health tribe_civilization.data matches 335..340 run attribute @s scale base set 2.845
execute if score #health tribe_civilization.data matches 340..345 run attribute @s scale base set 2.8800000000000003
execute if score #health tribe_civilization.data matches 345..350 run attribute @s scale base set 2.915
execute if score #health tribe_civilization.data matches 350..355 run attribute @s scale base set 2.9499999999999997
execute if score #health tribe_civilization.data matches 355..360 run attribute @s scale base set 2.985
execute if score #health tribe_civilization.data matches 360..365 run attribute @s scale base set 3.02
execute if score #health tribe_civilization.data matches 365..370 run attribute @s scale base set 3.0549999999999997
execute if score #health tribe_civilization.data matches 370..375 run attribute @s scale base set 3.09
execute if score #health tribe_civilization.data matches 375..380 run attribute @s scale base set 3.125
execute if score #health tribe_civilization.data matches 380..385 run attribute @s scale base set 3.16
execute if score #health tribe_civilization.data matches 385..390 run attribute @s scale base set 3.1950000000000003
execute if score #health tribe_civilization.data matches 390..395 run attribute @s scale base set 3.23
execute if score #health tribe_civilization.data matches 395..400 run attribute @s scale base set 3.265
execute if score #health tribe_civilization.data matches 400..405 run attribute @s scale base set 3.3000000000000003
execute if score #health tribe_civilization.data matches 405..410 run attribute @s scale base set 3.335
execute if score #health tribe_civilization.data matches 410..415 run attribute @s scale base set 3.3699999999999997
execute if score #health tribe_civilization.data matches 415..420 run attribute @s scale base set 3.405
execute if score #health tribe_civilization.data matches 420..425 run attribute @s scale base set 3.44
execute if score #health tribe_civilization.data matches 425..430 run attribute @s scale base set 3.475
execute if score #health tribe_civilization.data matches 430..435 run attribute @s scale base set 3.51
execute if score #health tribe_civilization.data matches 435..440 run attribute @s scale base set 3.545
execute if score #health tribe_civilization.data matches 440..445 run attribute @s scale base set 3.58
execute if score #health tribe_civilization.data matches 445..450 run attribute @s scale base set 3.615
execute if score #health tribe_civilization.data matches 450..455 run attribute @s scale base set 3.65
execute if score #health tribe_civilization.data matches 455..460 run attribute @s scale base set 3.685
execute if score #health tribe_civilization.data matches 460..465 run attribute @s scale base set 3.72
execute if score #health tribe_civilization.data matches 465..470 run attribute @s scale base set 3.7550000000000003
execute if score #health tribe_civilization.data matches 470..475 run attribute @s scale base set 3.79
execute if score #health tribe_civilization.data matches 475..480 run attribute @s scale base set 3.8249999999999997
execute if score #health tribe_civilization.data matches 480..485 run attribute @s scale base set 3.86
execute if score #health tribe_civilization.data matches 485..490 run attribute @s scale base set 3.895
execute if score #health tribe_civilization.data matches 490..495 run attribute @s scale base set 3.9299999999999997
execute if score #health tribe_civilization.data matches 495..500 run attribute @s scale base set 3.965
execute if score #health tribe_civilization.data matches 500..505 run attribute @s scale base set 4.0

