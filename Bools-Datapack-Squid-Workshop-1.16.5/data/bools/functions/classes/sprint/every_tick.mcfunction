########################################
# sprint_begin = 1 when player starts sprinting
# sprint_end   = 1 when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update sprint_helper first 
scoreboard players set @s sprint_begin 0
scoreboard players set @s sprint_end 0