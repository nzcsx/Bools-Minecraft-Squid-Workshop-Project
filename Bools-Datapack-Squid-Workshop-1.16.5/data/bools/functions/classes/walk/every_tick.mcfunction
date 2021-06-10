########################################
# walk_begin tags when player starts walking
# walk_end   tags when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update walk_helper first 
execute if entity @s[scores={walk_begin=1}] run scoreboard players set @s walk_begin 0
execute if entity @s[scores={walk_end=1}  ] run scoreboard players set @s walk_end 0