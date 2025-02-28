########################################
# pearl_bool = 1 when player used ender_pearl
# pearl_bool = 0 when player does not
# before the execution of following commands, the game will update pearl_helper first 
scoreboard players set @s pearl_bool 0
execute if entity @s[scores={pearl_helper=1..}] run scoreboard players set @s pearl_bool 1
scoreboard players set @s pearl_helper 0