########################################
# walk_begin tags when player starts walking
# walk_end   tags when player stops
# the set 0 part is in check_every_tick
# before the execution of following commands, the game will update walk_helper first 
execute if entity @s[scores={walk_helper=1..,walk_bool=0}] run scoreboard players set @s walk_begin 1
execute if entity @s[scores={walk_helper=  0,walk_bool=1}] run scoreboard players set @s walk_end 1
########################################
# walk_bool   tags when player is walking
# walk_bool untags when player is not
# before the execution of following commands, the game will update walk_helper first 
execute if entity @s[scores={walk_helper=1..}] run scoreboard players set @s walk_bool 1
execute if entity @s[scores={walk_helper=  0}] run scoreboard players set @s walk_bool 0
execute if entity @s[scores={walk_helper=1..}] run scoreboard players set @s walk_helper 0