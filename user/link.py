
# Imports
from python_datapack.utils.database_helper import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:

    # Get the namespace and database (if needed, actually not needed here)
    database: dict[str, dict] = config["database"]
    namespace: str = config["namespace"]

    # Generate ores in the world
    CustomOreGeneration.all_with_config(config, ore_configs = {
        "steel_ore": [
            CustomOreGeneration(
                dimensions = ["minecraft:overworld"],
                maximum_height = 50,
                minimum_height = 0,
                veins_per_region = 2,
                vein_size_logic = 0.4,
            )
        ],
        "deepslate_steel_ore": [
            CustomOreGeneration(
                dimensions = ["minecraft:overworld"],
                maximum_height = 0,
                veins_per_region = 2,
                vein_size_logic = 0.4,
            )
        ],
    })


    pass

