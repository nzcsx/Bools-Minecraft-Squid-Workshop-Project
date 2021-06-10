########################################
# bow_bool   tags when player used a bow
# bow_bool untags when player does not
# before the execution of following commands, the game will update bow_helper first 
execute if entity @s[scores={bow_helper=1..}] run scoreboard players set @s bow_bool 1
execute if entity @s[scores={bow_helper=  0}] run scoreboard players set @s bow_bool 0
execute if entity @s[scores={bow_helper=1..}] run scoreboard players set @s bow_helper 0