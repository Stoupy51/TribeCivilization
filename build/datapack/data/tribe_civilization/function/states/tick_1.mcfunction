
#> tribe_civilization:states/tick_1
#
# @within	tribe_civilization:v1.0.0/tick
#

# Ensure effects
effect clear @a saturation
effect clear @a regeneration
effect give @a[gamemode=adventure] blindness infinite 255 true
effect give @a[gamemode=adventure] night_vision infinite 255 true
effect give @a[gamemode=adventure] darkness infinite 255 true

# Ask creative players to go next state
tellraw @a[gamemode=creative] [{"translate":"tribe_civilization.les_joueurs_suivants_nont_pas_répondu_à_la_question", "color":"red"},{"selector":"@a[scores={tribe_civilization.is_not_loyal=-1}]"}]
tellraw @a[gamemode=creative] [{"translate":"tribe_civilization.cliquez_ici_pour_passer_à_létat_suivant", "color":"dark_red", "clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:states/transition_to_2"}}]

