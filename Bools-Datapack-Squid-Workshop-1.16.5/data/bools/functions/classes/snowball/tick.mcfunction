########################################
# snowball_bool   tags when player used ender_pearl
# snowball_bool untags when player does not
# before the execution of following commands, the game will update snowball_bool first 
execute if entity @s[scores={snowball_helper=1..}] run scoreboard players set @s snowball_bool 1
execute if entity @s[scores={snowball_helper=  0}] run scoreboard players set @s snowball_bool 0
execute if entity @s[scores={snowball_helper=1..}] run scoreboard players set @s snowball_helper 0