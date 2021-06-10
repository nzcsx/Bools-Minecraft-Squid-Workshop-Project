########################################
# sprint_begin tags when player starts sprinting
# sprint_end   tags when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update sprint_helper first 
execute if entity @s[scores={sprint_begin=1}] run scoreboard players set @s sprint_begin 0
execute if entity @s[scores={sprint_end=  1}] run scoreboard players set @s sprint_end 0