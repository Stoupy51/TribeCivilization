
#> tribe_civilization:utils/adventure_zone_loop
#
# @within	tribe_civilization:v1.0.0/second with storage tribe_civilization:temp copy[0]
#			tribe_civilization:utils/adventure_zone_loop with storage tribe_civilization:temp copy[0]
#

# Check if player is in the zone
$tag @a[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] add tribe_civilization.adventure_zone

# Continue loop
data remove storage tribe_civilization:temp copy[0]
execute if data storage tribe_civilization:temp copy[0] run function tribe_civilization:utils/adventure_zone_loop with storage tribe_civilization:temp copy[0]

