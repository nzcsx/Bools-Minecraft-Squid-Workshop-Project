########################################
# container_bool   tags when player interact with barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper
# container_bool untags when player does not
# before the execution of following commands, the game will update containr_helper first 
execute unless entity @s[scores={contnr_helper00=0,contnr_helper01=0,contnr_helper02=0,contnr_helper03=0,contnr_helper04=0,contnr_helper05=0,contnr_helper06=0,contnr_helper07=0,contnr_helper08=0,contnr_helper09=0,contnr_helper10=0}] run scoreboard players set @s container_bool 1
execute if entity @s[scores={contnr_helper00=0,contnr_helper01=0,contnr_helper02=0,contnr_helper03=0,contnr_helper04=0,contnr_helper05=0,contnr_helper06=0,contnr_helper07=0,contnr_helper08=0,contnr_helper09=0,contnr_helper10=0}] run scoreboard players set @s container_bool 0
execute if entity @s[scores={contnr_helper00=1..}] run scoreboard players set @s contnr_helper00 0
execute if entity @s[scores={contnr_helper01=1..}] run scoreboard players set @s contnr_helper01 0
execute if entity @s[scores={contnr_helper02=1..}] run scoreboard players set @s contnr_helper02 0
execute if entity @s[scores={contnr_helper03=1..}] run scoreboard players set @s contnr_helper03 0
execute if entity @s[scores={contnr_helper04=1..}] run scoreboard players set @s contnr_helper04 0
execute if entity @s[scores={contnr_helper05=1..}] run scoreboard players set @s contnr_helper05 0
execute if entity @s[scores={contnr_helper06=1..}] run scoreboard players set @s contnr_helper06 0
execute if entity @s[scores={contnr_helper07=1..}] run scoreboard players set @s contnr_helper07 0
execute if entity @s[scores={contnr_helper08=1..}] run scoreboard players set @s contnr_helper08 0
execute if entity @s[scores={contnr_helper09=1..}] run scoreboard players set @s contnr_helper09 0
execute if entity @s[scores={contnr_helper10=1..}] run scoreboard players set @s contnr_helper10 0