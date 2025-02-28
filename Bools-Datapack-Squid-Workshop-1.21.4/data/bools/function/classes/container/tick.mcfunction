########################################
# container_bool = 1 when player interact with barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper
# container_bool = 0 when player does not
# before the execution of following commands, the game will update containr_helper first 
scoreboard players set @s container_bool 0
execute unless entity @s[scores={contnr_helper00=0,contnr_helper01=0,contnr_helper02=0,contnr_helper03=0,contnr_helper04=0,contnr_helper05=0,contnr_helper06=0,contnr_helper07=0,contnr_helper08=0,contnr_helper09=0,contnr_helper10=0}] run scoreboard players set @s container_bool 1
scoreboard players set @s contnr_helper00 0
scoreboard players set @s contnr_helper01 0
scoreboard players set @s contnr_helper02 0
scoreboard players set @s contnr_helper03 0
scoreboard players set @s contnr_helper04 0
scoreboard players set @s contnr_helper05 0
scoreboard players set @s contnr_helper06 0
scoreboard players set @s contnr_helper07 0
scoreboard players set @s contnr_helper08 0
scoreboard players set @s contnr_helper09 0
scoreboard players set @s contnr_helper10 0