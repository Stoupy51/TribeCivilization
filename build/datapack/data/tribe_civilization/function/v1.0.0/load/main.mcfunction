
#> tribe_civilization:v1.0.0/load/main
#
# @within	tribe_civilization:v1.0.0/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #tribe_civilization.loaded load.status matches 1 run function tribe_civilization:v1.0.0/load/secondary

