########################################
# carotClik_bool = 1 when player right clicked using carrot stick
# carotClik_bool = 0 when player does not
# before the execution of following commands, the game will update carotClik_helper first 
scoreboard players set @s carotClik_bool 0
execute if entity @s[scores={carotClik_helper=1..}] run scoreboard players set @s carotClik_bool 1
scoreboard players set @s carotClik_helper 0