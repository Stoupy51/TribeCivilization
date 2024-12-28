
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 1 is the introduction of the game. """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 1
execute if score #state {ns}.data matches 1 run function {ns}:states/tick_1
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_1", f"""
# Ensure effects
effect clear @a saturation
effect clear @a regeneration
effect give @a[gamemode=adventure] blindness infinite 255 true
effect give @a[gamemode=adventure] night_vision infinite 255 true
effect give @a[gamemode=adventure] darkness infinite 255 true

# Ask creative players to go next state
tellraw @a[gamemode=creative] [{{"text":"Les joueurs suivants n'ont pas répondu à la question : ", "color":"red"}},{{"selector":"@a[scores={{{ns}.is_not_loyal=-1}}]"}}]
tellraw @a[gamemode=creative] [{{"text":"[Cliquez ici] pour passer à l'état suivant", "color":"dark_red", "clickEvent":{{"action":"suggest_command","value":"/function {ns}:states/transition_to_2"}}}}]
""")

	# Transition to state 2
	write_to_function(config, f"{ns}:states/transition_to_2", f"""
# Set state to 2, and default is_not_loyal to 0 (loyal)
scoreboard players set #state {ns}.data 2
scoreboard players set @a[scores={{{ns}.is_not_loyal=-1}}] {ns}.is_not_loyal 0

# TODO: teams and teleportations
""")

	pass

