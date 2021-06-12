########################################
# update bools regularly
# discrete   updates once per every tick
# continuous updates once per three ticks
# discrete should be strictly before continuous
#  (because for some tags they follow the sequence: untagging in check_every_tick, tagging back in check_three_ticks)
# execute if score bools_timer bools_timer matches ..4 as @a run function bools:classes/core/check_every_tick
# execute if score bools_timer bools_timer matches 1 as @a run function bools:classes/core/check_three_ticks

execute as @a run function bools:classes/carotclik/tick
execute as @a run function bools:classes/fungiclik/tick
execute as @a run function bools:classes/fishrclik/tick

#execute as @a run function bools:classes/container/tick
execute as @a run scoreboard players set @s container_bool 0

execute as @a run function bools:classes/jump/tick
execute as @a run function bools:classes/offgrnd/tick

execute as @a run function bools:classes/bow/tick
execute as @a run function bools:classes/crossbow/tick

execute as @a run function bools:classes/pearl/tick
execute as @a run function bools:classes/snowball/tick

execute as @a run function bools:classes/shield/tick

execute as @a run function bools:classes/sleep/tick

execute as @a run function bools:classes/walk/tick
execute as @a run function bools:classes/shift/tick
execute as @a run function bools:classes/sprint/tick

########################################
# Timer ++
scoreboard players add timer bools 1

########################################
# if ( Timer == 4 )
# then reset the timer to 1
execute if score timer bools matches 4 run scoreboard players set timer bools 1