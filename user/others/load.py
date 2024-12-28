
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
    namespace: str = config["namespace"]
    version: str = config["version"]
    build_datapack: str = config["build_datapack"]

    # Load function
    write_to_load_file(config, f"""
# Configure RandomMobSizes
scoreboard players set #min_size random_mob_sizes.sizes 8000
scoreboard players set #max_size random_mob_sizes.sizes 12000

# Configure SmartOreGeneration
scoreboard players set _REGION_SIZE smart_ore_generation.data 192
""")
    write_to_file(f"{build_datapack}/pack.mcmeta", super_json_dump({"filter":{"block":[{"namespace":"nova_structures","path":"advancement"},{"namespace":"minecraft","path":"advancement"}]}}))

    # Update follow range of all entities to maximum
    write_to_versioned_file(config, "second_5", f"""
# Seek for new mobs
execute as @e[type=!player,type=!armor_stand,tag=!{namespace}.checked,{Conventions.AVOID_ENTITY_TAGS_NO_KILL}] run function {namespace}:v{version}/mobs/on_new_mob
""")
    write_to_versioned_file(config, "mobs/on_new_mob", f"""
attribute @s minecraft:follow_range base set 1024
tag @s add {namespace}.checked
""")


    pass

