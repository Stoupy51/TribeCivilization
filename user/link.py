
# Imports
from python_datapack.utils.database_helper import *
from user.others.load import main as load_main
from user.others.font import main as font_main
from user.functional.main import main as functional_main
from user.functional.player_loops import main as player_loops
from user.functional.falling_stars import main as falling_stars
from user.functional.life_crystals import main as life_crystals
from user.functional.lunar_compass import main as lunar_compass
from user.functional.inventory_tracking import main as inventory_tracking
from user.functional.state_0 import main as state_0
from user.functional.state_1 import main as state_1
from user.functional.state_2 import main as state_2
from user.functional.state_3 import main as state_3
from user.functional.state_4 import main as state_4

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
    load_main(config)
    font_main(config)
    functional_main(config)
    player_loops(config)
    falling_stars(config)
    life_crystals(config)
    lunar_compass(config)
    inventory_tracking(config)
    state_0(config)
    state_1(config)
    state_2(config)
    state_3(config)
    state_4(config)

