########################################
# fungiClik_bool   tags when player right clicked using fungus stick
# fungiClik_bool untags when player does not
# before the execution of following commands, the game will update fungiClik_helper first 
execute if entity @s[scores={fungiClik_helper=1..}] run scoreboard players set @s fungiClik_bool 1
execute if entity @s[scores={fungiClik_helper=  0}] run scoreboard players set @s fungiClik_bool 0
execute if entity @s[scores={fungiClik_helper=1..}] run scoreboard players set @s fungiClik_helper 0