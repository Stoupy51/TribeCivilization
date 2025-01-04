
#> tribe_civilization:falling_stars/selected_players
#
# @within	tribe_civilization:falling_stars/tick
#

# If already selected, skip
execute if entity @s[tag=tribe_civilization.selected] run return fail

# Add tag to nearby players and summon falling star
tag @a[distance=..20] add tribe_civilization.selected
execute summon item_display run function tribe_civilization:falling_stars/summon

