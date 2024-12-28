
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]

	# Player loops
	write_to_versioned_file(config, "second", f"""
# Each second loop for each player
execute as @a[sort=random] run function {ns}:player/second
""")
	write_to_function(config, f"{ns}:player/second", f"""
# Triggers
#TODO: Add triggers
""")

	pass

