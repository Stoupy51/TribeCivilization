
# Imports
from python_datapack.utils.database_helper import *

DARK_AQUA: str = "Tidal Wave"
YELLOW: str = "The Golden"
PURPLE: str = "Dream Flower"
GREEN: str = "Fire in the Hole"

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]

	# Loading objectives
	write_to_load_file(config, f"""
# Add teams
team add {ns}.dark_aqua
team add {ns}.yellow
team add {ns}.purple
team add {ns}.green
team modify {ns}.dark_aqua nametagVisibility never
team modify {ns}.yellow nametagVisibility never
team modify {ns}.purple nametagVisibility never
team modify {ns}.green nametagVisibility never
team modify {ns}.dark_aqua color dark_aqua
team modify {ns}.yellow color yellow
team modify {ns}.purple color dark_purple
team modify {ns}.green color green
team modify {ns}.dark_aqua prefix {{"text":"[{DARK_AQUA}] ","color":"dark_aqua"}}
team modify {ns}.yellow prefix {{"text":"[{YELLOW}] ","color":"yellow"}}
team modify {ns}.purple prefix {{"text":"[{PURPLE}] ","color":"dark_purple"}}
team modify {ns}.green prefix {{"text":"[{GREEN}] ","color":"green"}}

# Objectives
scoreboard objectives add {ns}.deathCount deathCount
scoreboard objectives add {ns}.trigger trigger
scoreboard objectives add {ns}.id dummy

scoreboard objectives add {ns}.is_not_loyal dummy

# Setup storage if not already done
execute unless data storage {ns}:main adventure_zones run data modify storage {ns}:main adventure_zones set value []
""")

	# Setup function
	camp_command: str = f"/data modify storage {ns}:main camp_XX set value {{x: 0, y: 0, z: 0}}"
	write_to_function(config, f"{ns}:setup", f"""
# Reset state
scoreboard players set #state {ns}.data 0

# Define camps zones
tellraw @s [{{"text":"Veuillez définir les zones de camps suivantes dans le monde :","color":"red"}}]
tellraw @s [{{"text":"- [{DARK_AQUA}]","color":"dark_aqua","clickEvent":{{"action":"suggest_command","value":"{camp_command.replace('XX', 'dark_aqua')}"}}}}]
tellraw @s [{{"text":"- [{YELLOW}]","color":"yellow","clickEvent":{{"action":"suggest_command","value":"{camp_command.replace('XX', 'yellow')}"}}}}]
tellraw @s [{{"text":"- [{PURPLE}]","color":"dark_purple","clickEvent":{{"action":"suggest_command","value":"{camp_command.replace('XX', 'purple')}"}}}}]
tellraw @s [{{"text":"- [{GREEN}]","color":"green","clickEvent":{{"action":"suggest_command","value":"{camp_command.replace('XX', 'green')}"}}}}]

tellraw @s [{{"text":"N'oubliez pas d'ajouter les [zones d'aventure] !","color":"red","clickEvent":{{"action":"suggest_command","value":"/function {ns}:utils/adventure_zone_add {{x: 0, y: 0, z: 0, dx: 0, dy: 0, dz: 0}}"}}}}]
""")
	
	# Add adventure zone functions
	write_to_function(config, f"{ns}:utils/adventure_zone_add", f"""
$data modify storage {ns}:main adventure_zones append value {{x: $(x), y: $(y), z: $(z), dx: $(dx), dy: $(dy), dz: $(dz)}}
""")
	write_to_versioned_file(config, "second", f"""
# Each second loop for every adventure zone
tag @a[tag={ns}.adventure_zone] add {ns}.previously_adventure_zone
tag @a[tag=!{ns}.adventure_zone] add {ns}.previously_survival_zone
tag @a[tag={ns}.adventure_zone] remove {ns}.adventure_zone
data modify storage {ns}:temp copy set from storage {ns}:main adventure_zones
execute if data storage {ns}:temp copy[0] run function {ns}:utils/adventure_zone_loop with storage {ns}:temp copy[0]
gamemode survival @a[gamemode=adventure,tag=!{ns}.adventure_zone,tag={ns}.previously_adventure_zone]
gamemode adventure @a[gamemode=survival,tag={ns}.adventure_zone,tag={ns}.previously_survival_zone]
tag @a[tag={ns}.previously_adventure_zone] remove {ns}.previously_adventure_zone
tag @a[tag={ns}.previously_survival_zone] remove {ns}.previously_survival_zone
""")
	write_to_function(config, f"{ns}:utils/adventure_zone_loop", f"""
# Check if player is in the zone
$tag @a[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] add {ns}.adventure_zone

# Continue loop
data remove storage {ns}:temp copy[0]
execute if data storage {ns}:temp copy[0] run function {ns}:utils/adventure_zone_loop with storage {ns}:temp copy[0]
""")

	pass

