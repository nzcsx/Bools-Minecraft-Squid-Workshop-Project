########################################
# crossbow_bool = 1 when player jumped
# crossbow_bool = 0 when player does not
# before the execution of following commands, the game will update crossbow_helper first 
scoreboard players set @s crossbow_bool 0
execute if entity @s[scores={crossbow_helper=1..}] run scoreboard players set @s crossbow_bool 1
scoreboard players set @s crossbow_helper 0