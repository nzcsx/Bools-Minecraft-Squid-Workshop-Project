########################################
# update bools regularly
# some update once per every tick
# some update once per three ticks
# discrete should be strictly before continuous
#  (because for some tags they follow the sequence: untagging in check_every_tick, tagging back in check_three_ticks)

execute as @a run function #bools:tick

########################################
# Timer ++
scoreboard players add timer bools 1

########################################
# if ( Timer == 4 )
# then reset the timer to 1
execute if score timer bools matches 4 run scoreboard players set timer bools 1