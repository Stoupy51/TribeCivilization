
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Constants
NB_SLICES: int = 100
MAX_HEALTH: int = 500	# Don't change this value because flemme
MIN_SCALE: float = 0.5
MAX_SCALE: float = 4.0

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
# Loop for the creature
execute as @e[tag={ns}.creature] at @s run function {ns}:states/creature_tick
""")
	
	# Tick for the creature
	sizes: str = ""
	for i in range(0, NB_SLICES + 1):
		step: float = i / NB_SLICES
		mini, maxi = int(step*MAX_HEALTH), int((step + 1/NB_SLICES)*MAX_HEALTH)
		sizes += f"execute if score #health {ns}.data matches {mini}..{maxi} run attribute @s scale base set {MIN_SCALE + (MAX_SCALE - MIN_SCALE) * step}\n"
	write_to_function(config, f"{ns}:states/creature_tick", f"""
# Bossbar to all traitors and players in range
tag @a[tag={ns}.traitor] add {ns}.creature_bar
tag @a[distance=..200] add {ns}.creature_bar
bossbar set {ns}:creature_bar players @a[tag={ns}.creature_bar]
tag @a[tag={ns}.creature_bar] remove {ns}.creature_bar

# Update bossbar value
execute store result score #health {ns}.data run data get entity @s Health
execute store result bossbar {ns}:creature_bar value run scoreboard players get #health {ns}.data

# Update entity size depending on health
{sizes}
""")
	
	# Advancement consumed blood
	write_to_advancement(config, f"{ns}:technical/consumed_blood", super_json_dump({
		"criteria": {
			"requirement": {
				"trigger": "minecraft:consume_item",
				"conditions": {
					"item": {
						"predicates": {
							"minecraft:custom_data": {ns: {"blood": True}}
						}
					}
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/blood"
		}
	}))

	# Reward function
	write_to_function(config, f"{ns}:advancements/blood", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/consumed_blood

# Join traitor team
tag @s add {ns}.traitor
team join {ns}.red @s

# Tell the team the coordinates
execute store result score #x {ns}.data run data get entity @s Pos[0]
execute store result score #y {ns}.data run data get entity @s Pos[0]
execute store result score #z {ns}.data run data get entity @s Pos[0]
tellraw @a[tag={ns}.traitor] [{{"selector":"@s"}},{{"text":" vient de se transformer !\nPosition : x="}},{{"score":{{"objective":"{ns}.data","name":"#x"}}}},{{"text":", y="}},{{"score":{{"objective":"{ns}.data","name":"#y"}}}},{{"text":", z="}},{{"score":{{"objective":"{ns}.data","name":"#z"}}}}]

# Summon lightning bolt
summon lightning_bolt ~ ~-10 ~

# Summon particles and play sound
particle sonic_boom ~ ~1 ~ 1 1 1 0 25 force @a[distance=..100]
playsound entity.warden.sonic_boom ambient @a[distance=..100]

# Equip horns
loot replace entity @s armor.head loot {ns}:i/small_horns
item modify entity @s armor.head {ns}:turn_into_small_horns

# Absorption
effect give @s absorption 240 4 true
""")
	
	# Item modifier
	write_to_file(path_to_file_path(config, f"{ns}:turn_into_small_horns", "item_modifier"), super_json_dump({
		"function": "minecraft:set_components",
		"components": {
			"minecraft:item_model": f"{ns}:small_horns",
			"minecraft:enchantments": {
				"levels": {
					"minecraft:protection": 1,
					"minecraft:binding_curse": 1
				}
			},
			"minecraft:enchantment_glint_override": False,
			"minecraft:unbreakable": {
				"show_in_tooltip": True
			}
		}
	}))


	pass

