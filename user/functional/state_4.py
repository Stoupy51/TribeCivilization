
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 4 is ??? """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 4
execute if score #state {ns}.data matches 4 run function {ns}:states/tick_4
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_4", f"""
# TODO: add functionality






""")


	pass

