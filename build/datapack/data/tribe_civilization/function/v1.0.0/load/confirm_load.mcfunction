
#> tribe_civilization:v1.0.0/load/confirm_load
#
# @within	tribe_civilization:v1.0.0/load/valid_dependencies
#

# Register the manual to the universal manual
execute unless data storage python_datapack:main universal_manual run data modify storage python_datapack:main universal_manual set value []
data remove storage python_datapack:main universal_manual[{"name":"Tribe Civilization"}]
data modify storage python_datapack:main universal_manual append value {"name":"Tribe Civilization","loot_table":"tribe_civilization:i/manual","hover":[{"text":""}, {"translate":"tribe_civilization_manual"}, {"text":"\\u0021\\u0021\\u1020\\n\\n\\n\\n\\n\\n", "font": "tribe_civilization:manual", "color": "white"}, {"translate":"tribe_civilization.guide_spirituel_des_nebuliens_ces_recettes_ont_ete_decouvertes_r", "color": "#505050", "font": "minecraft:illageralt"}]}

# Confirm load
tellraw @a[tag=convention.debug] {"translate":"tribe_civilization.loaded_tribe_civilization_v1_0_0","color":"green"}
scoreboard players set #tribe_civilization.loaded load.status 1

# Items storage
data modify storage tribe_civilization:items all set value {}
data modify storage tribe_civilization:items all.manual set value {"id": "minecraft:written_book","count": 1,"components": {"written_book_content": {"title": "Tribe Civilization Manual","author": "Stoupy51","pages": ["[{'text':''}, {'translate':'tribe_civilization_manual', 'underlined': True}, {'text':'\\u0021\\u0021\\u1020\\n\\n\\n\\n\\n\\n', 'font': 'tribe_civilization:manual', 'color': 'white'}, {'translate':'tribe_civilization.guide_spirituel_des_nebuliens_ces_recettes_ont_ete_decouvertes_r', 'color': '#505050', 'font': 'minecraft:illageralt'}]","[{'text':'', 'font': 'tribe_civilization:manual', 'color': 'white'}, {'text':'➤ ', 'font': 'minecraft:default', 'color': 'black'}, {'translate':'tribe_civilization.category_browser', 'font': 'minecraft:default', 'color': 'black', 'underlined': True}, '\\u0022\\u1021\\n']"]},"lore": ["['', {'text':'I', 'color': 'white', 'italic': false, 'font': 'tribe_civilization:icons'}, {'translate':'tribe_civilization', 'italic': true, 'color': 'blue'}]"],"item_model": "tribe_civilization:manual","enchantment_glint_override": false,"max_stack_size": 1}}

# Configure RandomMobSizes
scoreboard players set #min_size random_mob_sizes.sizes 8000
scoreboard players set #max_size random_mob_sizes.sizes 12000

