
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]

	# Add inventory changed advancement
	write_to_advancement(config, f"{ns}:technical/inventory_changed", {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:inventory_changed"
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/inventory_changed"
		}
	})

	# Prepare lines for advancement notifications
	other_notify: str = ""
	for item in ["life_crystal", "lunar_compass", "blood", "book_of_the_beginning", "book_of_the_end"]:
		other_notify += f"""
# {item.replace("_", " ").title()}
execute if items entity @s[tag=!{ns}.had_{item}] container.* *[custom_data~{{{ns}:{{"{item}":true}}}}] run tellraw @a[team={ns}.op] [{{"selector":"@s"}},{{"text":" a obtenu un {item.replace("_", " ").title()}"}}]
execute if items entity @s[tag=!{ns}.had_{item}] container.* *[custom_data~{{{ns}:{{"{item}":true}}}}] run tag @s add {ns}.had_{item}
"""

	# Add inventory changed function
	write_to_function(config, f"{ns}:advancements/inventory_changed", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/inventory_changed

## Notify OPs about obtained items
# Map
execute if items entity @s[tag=!{ns}.had_map] container.* filled_map run tellraw @a[team={ns}.op] [{{"selector":"@s"}},{{"text":" a obtenu une map"}}]
execute if items entity @s[tag=!{ns}.had_map] container.* filled_map run tag @s add {ns}.had_map
{other_notify}
""")

