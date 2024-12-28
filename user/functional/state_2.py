
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 2 is the first state of the game. """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 2 (that will always be active)
execute if score #state {ns}.data matches 2.. run function {ns}:states/tick_2
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_2", f"""
# TODO: add functionality






""")


	pass

