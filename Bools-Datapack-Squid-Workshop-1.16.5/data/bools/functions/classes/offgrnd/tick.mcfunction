########################################
# offGrnd_begin = 1 when player starts being off-ground
# offGrnd_end   = 1 when player stops
# before the execution of following commands, the game will update player data OnGround first. We record the previous offground in offground helper
scoreboard players set @s offGrnd_begin 0
scoreboard players set @s offGrnd_end 0
execute if entity @s[scores={offGrnd_helper=0},nbt={OnGround:false}] run scoreboard players set @s offGrnd_begin 1
execute if entity @s[scores={offGrnd_helper=1},nbt={OnGround:true }] run scoreboard players set @s offGrnd_end 1
execute if entity @s[nbt={OnGround:false}] run scoreboard players set @s offGrnd_helper 1
execute if entity @s[nbt={OnGround:true }] run scoreboard players set @s offGrnd_helper 0