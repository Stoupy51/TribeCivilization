
# Imports
from python_datapack.utils.database_helper import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
    database: dict[str, dict] = config["database"]
    namespace: str = config["namespace"]
    version: str = config["version"]
    build_datapack: str = config["build_datapack"]

    # Load function
    write_to_load_file(config, f"""
# Configure RandomMobSizes
scoreboard players set #min_size random_mob_sizes.sizes 8000
scoreboard players set #max_size random_mob_sizes.sizes 12000
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

    # Generate ores in the world
    # CustomOreGeneration.all_with_config(config, ore_configs = {
    #     "steel_ore": [
    #         CustomOreGeneration(
    #             dimensions = ["minecraft:overworld"],
    #             maximum_height = 50,
    #             minimum_height = 0,
    #             veins_per_region = 2,
    #             vein_size_logic = 0.4,
    #         )
    #     ],
    #     "deepslate_steel_ore": [
    #         CustomOreGeneration(
    #             dimensions = ["minecraft:overworld"],
    #             maximum_height = 0,
    #             veins_per_region = 2,
    #             vein_size_logic = 0.4,
    #         )
    #     ],
    # })


    pass

