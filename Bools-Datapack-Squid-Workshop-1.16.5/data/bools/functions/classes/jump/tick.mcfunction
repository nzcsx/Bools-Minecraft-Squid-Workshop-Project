########################################
# jump_bool   tags when player jumped
# jump_bool untags when player does not
# before the execution of following commands, the game will update jump_helper first 
execute if entity @s[scores={jump_helper=1..}] run scoreboard players set @s jump_bool 1
execute if entity @s[scores={jump_helper=  0}] run scoreboard players set @s jump_bool 0
execute if entity @s[scores={jump_helper=1..}] run scoreboard players set @s jump_helper 0