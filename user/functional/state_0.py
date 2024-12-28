
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
	""" State 0 is before the game starts. """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 0
execute if score #state {ns}.data matches 0 run function {ns}:states/tick_0
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_0", f"""
# Ensure effects
effect give @a saturation infinite 0 true
effect give @a regeneration infinite 0 true

# Ensure everyone has his ID
execute as @a unless score @s {ns}.id matches 1.. run function {ns}:utils/next_id
""")

	# Next ID
	write_to_function(config, f"{ns}:utils/next_id", f"""
# Increase previous global ID
scoreboard players add #next_id {ns}.data 1

# Copy next ID to player ID
scoreboard players operation @s {ns}.id = #next_id {ns}.data

# If state is 0 or 1, adventure mode, otherwise spectator mode
execute if score #state {ns}.data matches 0..1 run gamemode adventure @s
execute unless score #state {ns}.data matches 0..1 run gamemode spectator @s
""")

	# Start function
	backslash_n: str = "\\n" * 20
	write_to_function(config, f"{ns}:start", f"""
# TODO: add functionality
# Update state
scoreboard players set #state {ns}.data 1

# Set is_not_loyal to -1 for all players that are not in creative mode to ask them in the next state
scoreboard players set @a[gamemode=adventure] {ns}.is_not_loyal -1
tellraw @a[gamemode=adventure] [{{"text":"{backslash_n}Question simple : Voulez-vous être loyal à votre tribu ?", "color":"aqua"}}]
tellraw @a[gamemode=adventure] [{{"text":"[Je le serais]", "color":"green","clickEvent":{{"action":"run_command","value":"/trigger {ns}.trigger set 1"}},"hoverEvent":{{"action":"show_text","value":"Ma tribu peut compter sur moi !"}}}},{{"text":" | ","color":"gray"}},{{"text":"[Hell nah]", "color":"red","clickEvent":{{"action":"run_command","value":"/trigger {ns}.trigger set 2"}},"hoverEvent":{{"action":"show_text","value":"Dis moi en plus !"}}}}]








""")

	pass

