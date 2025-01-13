
# Imports
from python_datapack.utils.database_helper import *

# Constants
MAXIMUM_LIFE_CRYSTALS: int = 10
HEALTH_PER_CRYSTAL: float = 1.0

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]
	build_datapack: str = config["build_datapack"]

	# Make advancement when consuming a life crystal
	write_to_advancement(config, f"{ns}:technical/life_crystal", super_json_dump({
		"criteria": {
			"requirement": {
				"trigger": "minecraft:consume_item",
				"conditions": {
					"item": {
						"predicates": {
							"minecraft:custom_data": {ns: {"life_crystal": True}}
						}
					}
				}
			}
		},
		"rewards": {
			"function": f"{ns}:advancements/life_crystal"
		}
	}, max_level=-1))

	# Reward function
	increase_health: str = "\n".join([
		f"""attribute @s[scores={{{ns}.life_crystals={i}}}] max_health base set {20.0 + i*HEALTH_PER_CRYSTAL}\n""" + \
		f"""tellraw @s[scores={{{ns}.life_crystals={i}}}] [{{"text":"Vous avez mangé un cristal de vie ! [{i}/{MAXIMUM_LIFE_CRYSTALS}]","color":"green"}}]"""
		for i in range(MAXIMUM_LIFE_CRYSTALS + 1)
	])
	write_to_function(config, f"{ns}:advancements/life_crystal", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/life_crystal

# Increase life crystals score
scoreboard players add @s {ns}.life_crystals 1
execute if score @s {ns}.life_crystals matches {MAXIMUM_LIFE_CRYSTALS + 1}.. run playsound entity.villager.no ambient @s
execute if score @s {ns}.life_crystals matches {MAXIMUM_LIFE_CRYSTALS + 1}.. run loot give @s loot {ns}:i/life_crystal
execute if score @s {ns}.life_crystals matches {MAXIMUM_LIFE_CRYSTALS + 1}.. run tellraw @s [{{"text":"Vous ne pouvez plus consommer de cristaux de vie, vous avez atteint le maximum de {MAXIMUM_LIFE_CRYSTALS} cristaux de vie.","color":"red"}}]
execute if score @s {ns}.life_crystals matches {MAXIMUM_LIFE_CRYSTALS + 1}.. run scoreboard players set @s {ns}.life_crystals {MAXIMUM_LIFE_CRYSTALS}

# Increase health
{increase_health}
""")
