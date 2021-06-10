########################################
# shift_begin tags when player starts pressing shift
# shift_end   tags when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update shift_helper first 
execute if entity @s[scores={shift_begin=1}] run scoreboard players set @s shift_begin 0
execute if entity @s[scores={shift_end=  1}] run scoreboard players set @s shift_end 0