
# Imports
from python_datapack.utils.database_helper import *

# Constants
NIGHT_START: int = 13000
NIGHT_END: int = 23000
FALLING_STARS_SPAWN_CHANCE: float = 0.005
FALLING_STARS_DROP_CHANCE: float = 0.02

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]
	build_datapack: str = config["build_datapack"]
	TAG: str = f"{ns}.falling_star"

	# Compute how many falling stars to drop per player due to probabilities (in average)
	falling_stars_to_drop: float = (NIGHT_END - NIGHT_START) * FALLING_STARS_SPAWN_CHANCE * FALLING_STARS_DROP_CHANCE
	progress(f"Number of falling stars per night and per player (in average): {falling_stars_to_drop:.2f}")

	# Add to the tick function a check if night is during
	write_to_tick_file(config, f"""
# If game is running and night time, start the falling stars tick loop
execute store result score #daytime {ns}.data run time query daytime
execute if score #state {ns}.data matches 2.. if score #daytime {ns}.data matches {NIGHT_START}..{NIGHT_END} run function {ns}:falling_stars/tick
""")

	# Create a random chance predicates
	for chance in [FALLING_STARS_SPAWN_CHANCE, FALLING_STARS_DROP_CHANCE]:
		write_to_file(f"{build_datapack}/data/{ns}/predicate/chance/{chance}.json", super_json_dump({"condition": "minecraft:random_chance","chance": chance}))

	# Tick function
	write_to_function(config, f"{ns}:falling_stars/tick", f"""
# If last tick, kill the falling stars
execute if score #daytime {ns}.data matches {NIGHT_END} as @e[type=item] if data entity @s Item.components."minecraft:custom_data".{ns}.blue_star run kill @s
execute if score #daytime {ns}.data matches {NIGHT_END} run kill @e[tag={TAG}]

# For each alive player, if they are on surface, spawn a falling star with probability
execute as @a[gamemode=survival,predicate={ns}:chance/{FALLING_STARS_SPAWN_CHANCE}] at @s positioned over world_surface if entity @s[distance=..5] summon item_display run function {ns}:falling_stars/summon

# Tick function for each falling star
execute as @e[tag={TAG}] run function {ns}:falling_stars/entity_tick
""")

	# Summon function
	tags: str = "\n".join(f"tag @s add {c}" for c in Conventions.ENTITY_TAGS_NO_KILL)
	write_to_function(config, f"{ns}:falling_stars/summon", f"""
# Add tags
tag @s add {TAG}
{tags}

# TODO: add item, special rotation, etc.
""")


