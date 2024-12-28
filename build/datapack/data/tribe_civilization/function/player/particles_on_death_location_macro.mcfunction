
#> tribe_civilization:player/particles_on_death_location_macro
#
# @within	tribe_civilization:player/particles_on_death_location with storage tribe_civilization:temp death_location
#

$execute in $(dimension) positioned $(x) $(y) $(z) run particle block{block_state:"redstone_wire"} ~ ~1 ~ 0.35 0.5 0.35 0 500 force @a[distance=..100]
$execute in $(dimension) positioned $(x) $(y) $(z) run playsound block.beacon.deactivate ambient @a[distance=..100]

