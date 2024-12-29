
#> tribe_civilization:states/tick_1
#
# @within	tribe_civilization:v1.0.0/tick
#

# Ensure effects
execute if score #game_total_time tribe_civilization.data matches 40.. as @a run function tribe_civilization:utils/black_screen_0_100_0

# Ask creative players to go next state
tellraw @a[gamemode=creative] [{"translate":"tribe_civilization.les_joueurs_suivants_nont_pas_répondu_à_la_question", "color":"red"},{"selector":"@a[scores={tribe_civilization.is_not_loyal=-1}]"}]
tellraw @a[gamemode=creative] [{"translate":"tribe_civilization.donner_le_bundle_de_départ", "color":"dark_red", "clickEvent":{"action":"suggest_command","value":"/item replace entity @a hotbar.8 from entity @s hotbar.8"}}]
tellraw @a[gamemode=creative] [{"translate":"tribe_civilization.cliquez_ici_pour_passer_à_létat_suivant", "color":"dark_red", "clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:states/transition_to_2"}}]

