########################################
# shift_begin = 1 when player starts pressing shift
# shift_end   = 1 when player stops
# the tagging part is in check_three_ticks
# before the execution of following commands, the game will update shift_helper first 
scoreboard players set @s shift_begin 0
scoreboard players set @s shift_end 0

########################################
# shift_begin = 1 when player starts pressing shift
# shift_end   = 1 when player stops
# before the execution of following commands, the game will update shift_helper first 
execute if entity @s[scores={shift_helper=1..,shift_bool=0}] run scoreboard players set @s shift_begin 1
execute if entity @s[scores={shift_helper=  0,shift_bool=1}] run scoreboard players set @s shift_end 1

########################################
# shift_bool = 1 when player is pressing shift
# shift_bool = 0 when player is not
# before the execution of following commands, the game will update shift_helper first 
scoreboard players set @s shift_bool 0
execute if entity @s[scores={shift_helper=1..}] run scoreboard players set @s shift_bool 1
scoreboard players set @s shift_helper 0