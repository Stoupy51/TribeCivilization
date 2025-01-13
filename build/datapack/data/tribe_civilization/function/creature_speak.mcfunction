
#> tribe_civilization:creature_speak
#
# @within	tribe_civilization:states/turn_into_traitor {"msg":"Toi... Oui, toi... Je sens les ténèbres en toi... Tu as été choisi... pour servir mes desseins... Deviens mon agent dans l'ombre... Je vais avoir une mission pour toi... Patiente quelques minutes pendant que je contacte d'autres personnes..."}
#

$tellraw @s [{"translate":"tribe_civilization.créature","color":"dark_red"},{"text":"$(msg)"}]
execute as @s at @s run playsound entity.warden.attack_impact ambient @s

