
#> tribe_civilization:creature_speak_all
#
# @within	tribe_civilization:_setup {msg: \"Je vous baise\"}"}}]
#			tribe_civilization:states/traitor_messages_1 {"msg":"Bien, maintenant que les choses sont prêtes, je vais vous donner des instructions... Pour me libérer de mon sceau, vous devrez me rapporter des fragments..."}
#			tribe_civilization:states/traitor_messages_1 {"msg":"Il me faut 3 fragments de chaque couleur... Leur puissance sera suffisante pour me libérer... Je sais que votre mission n'est pas facile, c'est pourquoi je vous propose un temps de rendez-vous..."}
#			tribe_civilization:states/traitor_messages_1 {"msg":"Je vous laisse 10 minutes pour venir me rencontrer en 4800 6300... L'île est assez isolée, vous ne devriez trouver personne par hasard en ce lieu..."}
#

$tellraw @a[tag=tribe_civilization.traitor] [{"translate":"tribe_civilization.créature","color":"dark_red"},{"text":"$(msg)"}]
execute as @a[tag=tribe_civilization.traitor] at @s run playsound entity.warden.attack_impact ambient @s

