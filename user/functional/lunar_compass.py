
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
    ns: str = config["namespace"]

    # Make advancement when consuming a lunar compass
    write_to_advancement(config, f"{ns}:technical/lunar_compass", super_json_dump({
        "criteria": {
            "requirement": {
                "trigger": "minecraft:consume_item",
                "conditions": {
                    "item": {
                        "predicates": {
                            "minecraft:custom_data": {ns: {"lunar_compass": True}}
                        }
                    }
                }
            }
        },
        "rewards": {
            "function": f"{ns}:advancements/lunar_compass"
        }
    }, max_level=-1))

    # Reward function
    write_to_function(config, f"{ns}:advancements/lunar_compass", f"""
# Revoke advancement
advancement revoke @s only {ns}:technical/lunar_compass

# Effects and feedback
effect give @s blindness 3 0 true
effect give @s slowness 3 1 true
playsound block.beacon.activate ambient @s ~ ~ ~ 1 0.5
tellraw @s {{"text":"Une force mystérieuse vous guide vers le temple...","color":"aqua"}}

# Regive the lunar compass
loot give @s loot {ns}:i/lunar_compass

# Point to temple coordinates (these should match your temple location)
execute at @s facing 4240 100 5664 run tp @s ~ ~ ~ ~ ~
""")

