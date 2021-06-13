########################################
# shield_bool = 1 when player is holding shield in main hand or off hand
# shield_bool = 0 when player is not
# before the execution of following commands, the game will update inventory data first 
execute unless entity @s[nbt=!{Inventory:[{Slot:-106b,id:"minecraft:shield"}]},nbt=!{SelectedItem:{id:"minecraft:shield"}}] run scoreboard players set @s shield_bool 1
execute if entity @s[nbt=!{Inventory:[{Slot:-106b,id:"minecraft:shield"}]},nbt=!{SelectedItem:{id:"minecraft:shield"}}] run scoreboard players set @s shield_bool 0