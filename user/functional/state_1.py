
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 1 is the introduction of the game. """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 1
execute if score #state {ns}.data matches 1 run function {ns}:states/tick_1
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_1", f"""
# Ensure effects
execute if score #game_total_time {ns}.data matches 40.. as @a run function {ns}:utils/black_screen_0_100_0

# Ask creative players to go next state
tellraw @a[gamemode=creative] [{{"text":"Les joueurs suivants n'ont pas répondu à la question : ", "color":"red"}},{{"selector":"@a[scores={{{ns}.is_not_loyal=-1}}]"}}]
tellraw @a[gamemode=creative] [{{"text":"[Donner le bundle de départ]", "color":"dark_red", "clickEvent":{{"action":"suggest_command","value":"/item replace entity @a hotbar.8 from entity @s hotbar.8"}}}}]
tellraw @a[gamemode=creative] [{{"text":"[Cliquez ici] pour passer à l'état suivant", "color":"dark_red", "clickEvent":{{"action":"suggest_command","value":"/function {ns}:states/transition_to_2"}}}}]
""")

	# Transition to state 2
	write_to_function(config, f"{ns}:states/transition_to_2", f"""
# Set state to 2, and default is_not_loyal to 0 (loyal)
scoreboard players set #state {ns}.data 2
scoreboard players set @a[scores={{{ns}.is_not_loyal=-1}}] {ns}.is_not_loyal 0

# Clear all effects and make black screen fade out
effect clear @a
execute as @a run function {ns}:utils/black_screen_0_40_20

# Join teams
scoreboard players set #next_team {ns}.data 0
execute as @a[gamemode=adventure,sort=random] run function {ns}:teams/join_team

# Teleportations
data modify storage {ns}:main camp_dark_aqua.team set value "dark_aqua"
data modify storage {ns}:main camp_yellow.team set value "yellow"
data modify storage {ns}:main camp_purple.team set value "purple"
data modify storage {ns}:main camp_green.team set value "green"
function {ns}:teams/teleport with storage {ns}:main camp_dark_aqua
function {ns}:teams/teleport with storage {ns}:main camp_yellow
function {ns}:teams/teleport with storage {ns}:main camp_purple
function {ns}:teams/teleport with storage {ns}:main camp_green
execute as @a at @s run playsound {ns}:starting_round ambient @s
""")
	
	# Join team
	write_to_function(config, f"{ns}:teams/join_team", f"""
# Join team
execute if score #next_team {ns}.data matches 0 run team join {ns}.dark_aqua @s
execute if score #next_team {ns}.data matches 1 run team join {ns}.yellow @s
execute if score #next_team {ns}.data matches 2 run team join {ns}.purple @s
execute if score #next_team {ns}.data matches 3 run team join {ns}.green @s

# Colored leather helmet
execute if score #next_team {ns}.data matches 0 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=18803]
execute if score #next_team {ns}.data matches 1 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=13224192]
execute if score #next_team {ns}.data matches 2 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=6422691]
execute if score #next_team {ns}.data matches 3 run item replace entity @s armor.head with leather_helmet[max_damage=20020901,dyed_color=26880]

# Increment next team (modulo 4)
scoreboard players add #next_team {ns}.data 1
execute if score #next_team {ns}.data matches 4 run scoreboard players set #next_team {ns}.data 0
""")
	
	# Teleport function
	write_to_function(config, f"{ns}:teams/teleport", f"$tp @a[team={ns}.$(team)] $(x) $(y) $(z)")

	pass

