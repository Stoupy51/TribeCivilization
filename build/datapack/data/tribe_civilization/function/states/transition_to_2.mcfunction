
#> tribe_civilization:states/transition_to_2
#
# @within	???
#

# Set state to 2, and default is_not_loyal to 0 (loyal)
scoreboard players set #state tribe_civilization.data 2
scoreboard players set @a[scores={tribe_civilization.is_not_loyal=-1}] tribe_civilization.is_not_loyal 0

# TODO: teams and teleportations

