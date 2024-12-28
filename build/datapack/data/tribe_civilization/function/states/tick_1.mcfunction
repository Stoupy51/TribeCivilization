
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
tellraw @a[gamemode=creative] [{"text":"Les joueurs suivants n'ont pas répondu à la question : ", "color":"red"},{"selector":"@a[scores={tribe_civilization.is_not_loyal=-1}]"}]
tellraw @a[gamemode=creative] [{"text":"[Cliquez ici] pour passer à l'état suivant", "color":"dark_red", "clickEvent":{"action":"suggest_command","value":"/function tribe_civilization:states/transition_to_2"}}]

