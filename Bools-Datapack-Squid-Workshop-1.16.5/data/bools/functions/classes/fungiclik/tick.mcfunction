########################################
# fungiClik_bool = 1 when player right clicked using fungus stick
# fungiClik_bool = 0 when player does not
# before the execution of following commands, the game will update fungiClik_helper first 
scoreboard players set @s fungiClik_bool 0
execute if entity @s[scores={fungiClik_helper=1..}] run scoreboard players set @s fungiClik_bool 1
scoreboard players set @s fungiClik_helper 0