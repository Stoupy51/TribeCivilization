
# Imports
from python_datapack.utils.database_helper import *
from user.others.load import main as load_main
from user.functional.main import main as functional_main
from user.functional.player_loops import main as player_loops

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
    load_main(config)
    functional_main(config)
    player_loops(config)

