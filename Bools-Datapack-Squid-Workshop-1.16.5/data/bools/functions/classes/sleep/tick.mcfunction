########################################
# before the execution of following commands, the game will update SleepTimer first. We store SleepTimer in sleep_helper
execute store result score @s sleep_helper run data get entity @s SleepTimer 1
########################################
# sleep_begin tags when player starts sleeping
# sleep_end   tags when player stops
# before the execution of following commands, the game will update SleepTimer first. We stored SleepTimer in sleep_helper.
execute if entity @s[scores={sleep_begin=1}] run scoreboard players set @s sleep_begin 0
execute if entity @s[scores={sleep_end=  1}] run scoreboard players set @s sleep_end 0
execute if entity @s[scores={sleep_helper=1..,sleep_bool=0}] run scoreboard players set @s sleep_begin 1
execute if entity @s[scores={sleep_helper=  0,sleep_bool=1}] run scoreboard players set @s sleep_end 1
########################################
# sleep_bool tags   when player is sleeping
# sleep_bool untags when player is not
# before the execution of following commands, the game will update SleepTimer first. We stored SleepTimer in sleep_helper.
execute if entity @s[scores={sleep_helper=1..}] run scoreboard players set @s sleep_bool 1
execute if entity @s[scores={sleep_helper=  0}] run scoreboard players set @s sleep_bool 0
# since SleepTimer can reset itself, we dont need to reset sleep_helper