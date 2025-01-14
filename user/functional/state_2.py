
# Imports
from python_datapack.utils.database_helper import *
from user.functional.main import DARK_AQUA, YELLOW, PURPLE, GREEN

# Main function
def main(config: dict) -> None:
	""" State 2 is the first state of the game. """
	ns: str = config["namespace"]

	# Register tick function
	write_to_tick_file(config, f"""
# Tick function for state 2 (that will always be active)
execute if score #state {ns}.data matches 2.. run function {ns}:states/tick_2
""")
	
	# Tick
	write_to_function(config, f"{ns}:states/tick_2", f"""
# Always saturation if not foodLevel at max for traitors
execute as @a[tag={ns}.traitor] unless data entity @s {{foodLevel:20}} run effect give @s saturation 1 0 true

# Control entity as OP
execute as @a[gamemode=creative,team={ns}.op] at @s run function {ns}:entity/control_nearest
""")

	# Function speak as the creature to @s or @a[tag={ns}.traitor]
	def basic_sound(selector: str = "@s") -> str:
		return f"\nexecute as {selector} at @s run playsound entity.warden.attack_impact ambient @s"
	write_to_function(config, f"{ns}:creature_speak", f"""$tellraw @s [{{"text":"[Créature] ","color":"dark_red"}},{{"text":"$(msg)"}}]""" + basic_sound("@s"))
	write_to_function(config, f"{ns}:creature_speak_all", f"""$tellraw @a[tag={ns}.traitor] [{{"text":"[Créature] ","color":"dark_red"}},{{"text":"$(msg)"}}]""" + basic_sound(f"@a[tag={ns}.traitor]"))
	write_to_function(config, f"{ns}:creature_speak_all_close", f"""$tellraw @a[tag={ns}.traitor,distance=..100] [{{"text":"[Créature] ","color":"dark_red"}},{{"text":"$(msg)"}}]""" + basic_sound(f"@a[tag={ns}.traitor,distance=..100]"))

	# Create an advancement that will be used to turn a player into a traitor
	write_to_advancement(config, f"{ns}:technical/turn_into_traitor", super_json_dump({
		"criteria": {
			"requirement": {
				"trigger": "minecraft:impossible"
			}
		},
		"rewards": {
			"function": f"{ns}:states/turn_into_traitor"
		}
	}, max_level=-1))

	# Create a function that will be called to turn a player into a traitor
	write_to_function(config, f"{ns}:states/turn_into_traitor", f"""
# Advancement revoke
advancement revoke @s only {ns}:technical/turn_into_traitor

# Add tag without changing team (undercover)
tag @s add {ns}.traitor

# Playsound and tellraw
tellraw @s ""
playsound minecraft:entity.warden.roar master @s
title @s times 5 80 20
title @s title {{"text":"PAS UN MOT","color":"red"}}
title @s subtitle {{"text":"Silence...","color":"dark_red"}}
function {ns}:creature_speak {{"msg":"Toi... Oui, toi... Je sens les ténèbres en toi... Tu as été choisi... pour servir mes desseins... Deviens mon agent dans l'ombre... Je vais avoir une mission pour toi... Patiente quelques minutes pendant que je contacte d'autres personnes..."}}
tellraw @s ""
""")
	
	# Function called by admin that send the next messages
	write_to_function(config, f"{ns}:states/traitor_messages_1", f"""
# Playsound
playsound {ns}:fetch_me_their_souls ambient @s

# Tellraw
tellraw @s ""
function {ns}:creature_speak_all {{"msg":"Bien, maintenant que les choses sont prêtes, je vais vous donner des instructions... Pour me libérer de mon sceau, vous devrez me rapporter des fragments..."}}
tellraw @s ""
function {ns}:creature_speak_all {{"msg":"Il me faut 3 fragments de chaque couleur... Leur puissance sera suffisante pour me libérer... Je sais que votre mission n'est pas facile, c'est pourquoi je vous propose un temps de rendez-vous..."}}
tellraw @s ""
function {ns}:creature_speak_all {{"msg":"Je vous laisse 10 minutes pour venir me rencontrer en 4800 6300... L'île est assez isolée, vous ne devriez trouver personne par hasard en ce lieu..."}}
tellraw @s ""
""")

	# Function called by admin that control the nearest entity
	write_to_function(config, f"{ns}:entity/control_nearest", f"""
# Control entity
tp @n[type=warden,distance=..5] @s
""")

	pass

