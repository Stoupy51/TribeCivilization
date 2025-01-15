
# Imports
from python_datapack.utils.database_helper import *

# Main function
def main(config: dict) -> None:
	ns: str = config["namespace"]

	# Player loops
	write_to_versioned_file(config, "tick", f"""
# Each tick loop for each player
execute as @a[sort=random] run function {ns}:player/tick
""")
	write_to_function(config, f"{ns}:player/tick", f"""
# Ensure everyone has his ID
execute unless score @s {ns}.id matches 1.. run function {ns}:utils/next_id

# Triggers
scoreboard players enable @s {ns}.trigger
execute unless score @s {ns}.trigger matches 0 run function {ns}:player/trigger

# Particles on death location
execute if score @s {ns}.deathCount matches 1.. run function {ns}:player/particles_on_death_location

# If traitor, loop
execute if entity @s[tag={ns}.traitor] run function {ns}:player/traitor_loop
""")
	
	# Trigger
	write_to_function(config, f"{ns}:player/trigger", f"""
# State 1 vote (loyal or not)
execute if score #state {ns}.data matches 1 if score @s {ns}.trigger matches 1 run scoreboard players set @s {ns}.is_not_loyal 0
execute if score #state {ns}.data matches 1 if score @s {ns}.trigger matches 2 run scoreboard players set @s {ns}.is_not_loyal 1
execute if score #state {ns}.data matches 1 if score @s {ns}.trigger matches 1 run tellraw @s [{{"text":"Votre souhait d'être loyal a été pris en compte !", "color":"green"}}]
execute if score #state {ns}.data matches 1 if score @s {ns}.trigger matches 2 run tellraw @s [{{"text":"Votre souhait de ne pas être loyal a été pris en compte !", "color":"red"}}]
execute if score #state {ns}.data matches 1 if score @s {ns}.trigger matches 1..2 run playsound ui.button.click

# Reset trigger
scoreboard players set @s {ns}.trigger 0
""")

	# Particles on death location
	write_to_function(config, f"{ns}:player/particles_on_death_location", f"""
# Get death location
data modify storage {ns}:temp death_location set value {{dimension:"",x:0,y:0,z:0}}
data modify storage {ns}:temp death_location.dimension set from entity @s LastDeathLocation.dimension
data modify storage {ns}:temp death_location.x set from entity @s LastDeathLocation.pos[0]
data modify storage {ns}:temp death_location.y set from entity @s LastDeathLocation.pos[1]
data modify storage {ns}:temp death_location.z set from entity @s LastDeathLocation.pos[2]

# Game over sound
execute at @s run playsound {ns}:game_over ambient @s

# Particles and playsound, reset death count, and make sure spectator mode
function {ns}:player/on_death_location_macro with storage {ns}:temp death_location
scoreboard players reset @s {ns}.deathCount
gamemode spectator @s
""")
	write_to_function(config, f"{ns}:player/on_death_location_macro", f"""
# Particles and playsound
$execute in $(dimension) positioned $(x) $(y) $(z) run particle block{{block_state:"redstone_wire"}} ~ ~1 ~ 0.35 0.5 0.35 0 666 force @a[distance=..100]

# Depending on the team, drop a crystal
$execute if score #state {ns}.data matches 1.. if entity @s[team={ns}.dark_aqua] in $(dimension) run loot spawn $(x) $(y) $(z) loot {ns}:i/cyan_crystal
$execute if score #state {ns}.data matches 1.. if entity @s[team={ns}.yellow] in $(dimension) run loot spawn $(x) $(y) $(z) loot {ns}:i/yellow_crystal
$execute if score #state {ns}.data matches 1.. if entity @s[team={ns}.purple] in $(dimension) run loot spawn $(x) $(y) $(z) loot {ns}:i/purple_crystal
$execute if score #state {ns}.data matches 1.. if entity @s[team={ns}.green] in $(dimension) run loot spawn $(x) $(y) $(z) loot {ns}:i/green_crystal
""")
	
	# Traitor loop
	write_to_function(config, f"{ns}:player/traitor_loop", f"""
# Effects given to the traitor
effect give @s regeneration 1 0 true
effect give @s night_vision 1 0 true
effect give @s resistance 1 0 true
effect give @s strength 1 0 true
effect give @s speed 1 1 true

# Always saturation if not foodLevel at max for traitors
execute unless data entity @s {{foodLevel:20}} run effect give @s saturation 1 0 true
""")

	pass

