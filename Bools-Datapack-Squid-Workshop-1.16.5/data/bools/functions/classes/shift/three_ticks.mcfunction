########################################
# shift_begin tags when player starts pressing shift
# shift_end   tags when player stops
# the set 0 part is in check_every_tick
# before the execution of following commands, the game will update shift_helper first 
execute if entity @s[scores={shift_helper=1..,shift_bool=0}] run scoreboard players set @s shift_begin 1
execute if entity @s[scores={shift_helper=  0,shift_bool=1}] run scoreboard players set @s shift_end 1
########################################
# shift_bool tags   when player is pressing shift
# shift_bool untags when player is not
# before the execution of following commands, the game will update shift_helper first 
execute if entity @s[scores={shift_helper=1..}] run scoreboard players set @s shift_bool 1
execute if entity @s[scores={shift_helper=  0}] run scoreboard players set @s shift_bool 0
execute if entity @s[scores={shift_helper=1..}] run scoreboard players set @s shift_helper 0