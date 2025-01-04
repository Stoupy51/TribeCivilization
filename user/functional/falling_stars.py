
# Imports
from python_datapack.utils.database_helper import *

# Constants
NIGHT_START: int = 13000
NIGHT_END: int = 23000
FALLING_STARS_SPAWN_CHANCE: float = 0.01
FALLING_STARS_DROP_CHANCE: float = 0.1
DURATION: int = 30
TRANSLATION_X: int = 20
TRANSLATION_Y: int = 15
TRANSLATION_STEP_X: float = TRANSLATION_X / DURATION
TRANSLATION_STEP_Y: float = TRANSLATION_Y / DURATION

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]
	build_datapack: str = config["build_datapack"]
	TAG: str = f"{ns}.falling_star"

	# Compute how many falling stars to drop per group of players due to probabilities (in average)
	falling_stars_to_drop: float = (NIGHT_END - NIGHT_START) * FALLING_STARS_SPAWN_CHANCE * FALLING_STARS_DROP_CHANCE
	progress(f"Number of falling stars per night and per group of players (in average): {falling_stars_to_drop:.2f}")

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
# TODO: Not for each player but group of players
execute as @a[gamemode=!spectator,predicate={ns}:chance/{FALLING_STARS_SPAWN_CHANCE}] at @s positioned over world_surface if entity @s[distance=..5] summon item_display run function {ns}:falling_stars/summon

# Tick function for each falling star
execute as @e[tag={TAG}] at @s run function {ns}:falling_stars/entity_tick
""")

	# Summon function
	tags: str = "\n".join(f"tag @s add {c}" for c in Conventions.ENTITY_TAGS_NO_KILL)
	write_to_function(config, f"{ns}:falling_stars/summon", f"""
# Add tags
tag @s add {TAG}
{tags}

# Take a random position
execute at @s run spreadplayers ~ ~ 0 5 false @s

# Define initial position and scale, and playsound
playsound {ns}:falling_star ambient @a[distance=..20]
data modify entity @s transformation.translation set value [{TRANSLATION_X}.0f, {TRANSLATION_Y}.0f, 0.0f]
data modify entity @s transformation.left_rotation set value {{angle:0.0f,axis:[0.0f,0.0f,1.0f]}}
data modify entity @s transformation.scale set value [0.8f, 0.8f, 0.8f]
scoreboard players set @s {ns}.timer 0

# Random rotation
execute store result entity @s Rotation[0] float 1 run random value -8..8
execute store result entity @s Rotation[1] float 1 run random value -8..8

# Add item
loot replace entity @s contents loot {ns}:i/blue_star
""")

	# Compute particles
	particles: str = ""
	for i in range(DURATION):
		x: float = TRANSLATION_X - (i * TRANSLATION_STEP_X)
		y: float = TRANSLATION_Y - (i * TRANSLATION_STEP_Y)
		particles += f"execute if score @s {ns}.timer matches {i} run particle dust{{color:[0.0,0.0,1.0],scale:0.5}} ~{x} ~{y} ~ 0.5 0.5 0.5 0 25 normal\n"

	# Entity tick function
	write_to_function(config, f"{ns}:falling_stars/entity_tick", f"""
# Movement forward
scoreboard players add @s {ns}.timer 1
execute if score @s {ns}.timer matches 2 run data merge entity @s {{transformation:{{left_rotation:{{angle:-180.0f,axis:[0.0f,0.0f,1.0f]}},translation:[0.0f, 0.0f, 0.0f]}},interpolation_duration:{DURATION},start_interpolation:0}}
{particles}

# Action when hitting the ground
execute if score @s {ns}.timer matches {DURATION}.. if predicate {ns}:chance/{FALLING_STARS_DROP_CHANCE} run function {ns}:falling_stars/drop
execute if score @s {ns}.timer matches {DURATION}.. run kill @s
""")

	# Drop function
	write_to_function(config, f"{ns}:falling_stars/drop", f"""
# Drop item
loot spawn ~ ~ ~ loot {ns}:i/blue_star
setblock ~ ~-1 ~ air destroy
""")


