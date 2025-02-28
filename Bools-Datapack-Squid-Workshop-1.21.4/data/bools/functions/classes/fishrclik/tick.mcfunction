########################################
# fishrClik_bool = 1 when player right clicked using fishing rod
# fishrClik_bool = 0 when player does not
# before the execution of following commands, the game will update fishrClik_helper first 
scoreboard players set @s fishrClik_bool 0
execute if entity @s[scores={fishrClik_helper=1..}] run scoreboard players set @s fishrClik_bool 1
scoreboard players set @s fishrClik_helper 0