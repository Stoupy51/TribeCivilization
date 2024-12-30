
# Imports
from python_datapack.utils.database_helper import *
from python_datapack.utils.ingredients import *
from python_datapack.constants import *
from user.database.items import main as items_main
from user.database.books import main as books_main

# Main function should return a database
def main(config: dict) -> dict[str, dict]:
    database: dict[str,dict] = {}

    # Generate items
    generate_custom_records(config, database, "auto")
    items_main(config, database)
    black_list: list[str] = books_main(config, database)

    # Final adjustments, you definitively should keep them!
    add_item_model_component(config, database, black_list=black_list)
    add_item_name_and_lore_if_missing(config, database)
    add_private_custom_data_for_namespace(config, database)
    add_smithed_ignore_vanilla_behaviours_convention(database)

    # Return database
    return database

