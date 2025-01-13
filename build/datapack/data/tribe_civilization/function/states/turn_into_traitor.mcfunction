
#> tribe_civilization:states/turn_into_traitor
#
# @within	advancement tribe_civilization:technical/turn_into_traitor
#

# Advancement revoke
advancement revoke @s only tribe_civilization:technical/turn_into_traitor

# Add tag without changing team (undercover)
tag @s add tribe_civilization.traitor

# Playsound and tellraw
tellraw @s ""
playsound minecraft:entity.warden.roar master @s
title @s times 5 80 20
title @s title {"translate":"tribe_civilization.pas_un_mot","color":"red"}
title @s subtitle {"translate":"tribe_civilization.silence","color":"dark_red"}
function tribe_civilization:creature_speak {"msg":"Toi... Oui, toi... Je sens les ténèbres en toi... Tu as été choisi... pour servir mes desseins... Deviens mon agent dans l'ombre... Je vais avoir une mission pour toi... Patiente quelques minutes pendant que je contacte d'autres personnes..."}
tellraw @s ""

