########################################
# walk_begin = 1 when player starts walking
# walk_end   = 1 when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update walk_helper first 
scoreboard players set @s walk_begin 0
scoreboard players set @s walk_end 0