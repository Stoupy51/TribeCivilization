
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 3 is ??? """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 3
execute if score #state {ns}.data matches 3 run function {ns}:states/tick_3
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_3", f"""
# TODO: add functionality






""")


	pass

