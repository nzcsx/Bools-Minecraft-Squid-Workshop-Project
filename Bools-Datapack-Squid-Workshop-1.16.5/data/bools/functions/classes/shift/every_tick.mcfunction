########################################
# shift_begin = 1 when player starts pressing shift
# shift_end   = 1 when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update shift_helper first 
scoreboard players set @s shift_begin 0
scoreboard players set @s shift_end 0