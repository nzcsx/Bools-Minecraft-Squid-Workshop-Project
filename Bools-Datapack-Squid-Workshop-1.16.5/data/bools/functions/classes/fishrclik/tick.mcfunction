########################################
# fishrClik_bool   tags when player right clicked using fishing rod
# fishrClik_bool untags when player does not
# before the execution of following commands, the game will update fishrClik_helper first 
execute if entity @s[scores={fishrClik_helper=1..}] run scoreboard players set @s fishrClik_bool 1
execute if entity @s[scores={fishrClik_helper=  0}] run scoreboard players set @s fishrClik_bool 0
execute if entity @s[scores={fishrClik_helper=1..}] run scoreboard players set @s fishrClik_helper 0