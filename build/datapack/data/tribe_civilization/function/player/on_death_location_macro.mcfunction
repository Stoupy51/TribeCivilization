
#> tribe_civilization:player/on_death_location_macro
#
# @within	tribe_civilization:player/particles_on_death_location with storage tribe_civilization:temp death_location
#

# Particles and playsound
$execute in $(dimension) positioned $(x) $(y) $(z) run particle block{block_state:"redstone_wire"} ~ ~1 ~ 0.35 0.5 0.35 0 500 force @a[distance=..100]

# Depending on the team, drop a crystal
$execute if score #state tribe_civilization.data matches 1.. if entity @s[team=tribe_civilization.dark_aqua] in $(dimension) run loot spawn $(x) $(y) $(z) loot tribe_civilization:i/cyan_crystal
$execute if score #state tribe_civilization.data matches 1.. if entity @s[team=tribe_civilization.yellow] in $(dimension) run loot spawn $(x) $(y) $(z) loot tribe_civilization:i/yellow_crystal
$execute if score #state tribe_civilization.data matches 1.. if entity @s[team=tribe_civilization.purple] in $(dimension) run loot spawn $(x) $(y) $(z) loot tribe_civilization:i/purple_crystal
$execute if score #state tribe_civilization.data matches 1.. if entity @s[team=tribe_civilization.green] in $(dimension) run loot spawn $(x) $(y) $(z) loot tribe_civilization:i/green_crystal

