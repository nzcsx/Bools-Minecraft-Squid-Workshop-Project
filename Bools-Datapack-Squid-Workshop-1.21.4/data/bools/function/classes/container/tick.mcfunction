########################################
# container_bool = 1 when player interact with barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper
# container_bool = 0 when player does not
# before the execution of following commands, the game will update advancement and containr_helper first 
scoreboard players operation @s container_bool = @s container_helper
scoreboard players set @s container_helper 0
advancement revoke @s only bools:container