########################################
# sprint_begin = 1 when player starts sprinting
# sprint_end   = 1 when player stops
# the set 0 part is in check_every_tick
# before the execution of following commands, the game will update sprint_helper first 
execute if entity @s[scores={sprint_helper=1..,sprint_bool=0}] run scoreboard players set @s sprint_begin 1
execute if entity @s[scores={sprint_helper=  0,sprint_bool=1}] run scoreboard players set @s sprint_end 1
########################################
# sprint_bool tags   when player is sprinting
# sprint_bool untags when player is not
# before the execution of following commands, the game will update sprint_helper first 
scoreboard players set @s sprint_bool 0
execute if entity @s[scores={sprint_helper=1..}] run scoreboard players set @s sprint_bool 1
scoreboard players set @s sprint_helper 0