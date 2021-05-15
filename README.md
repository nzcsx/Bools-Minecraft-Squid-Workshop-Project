# _Squid Workshop's_ Bools Data Pack
A minecraft datapack library for global boolean system, which translates player's in-game actions into the form of scoreboard tags.

- [Abstract](#Abstract)
- [Installation](#installation)
- [Usage](#Usage)
- [How it works](#How-it-works)
- [Project Tree](#Project-Tree)
- [Incompactibility](#Incompactibility)
- [Terms of Use](#Terms-of-Use)
- [More About Squid Workshop](#More-About-Squid-Workshop)

# Abstract
Minecraft provides a lot of counters that count the player actions (the amount of jumps, meters traveled, etc) in scoreboard objectives or nbt tags. This data pack translates  those player actions into booleans. I chose to use scoreboard tags because they have only two states (Tagged == True, Untagged == False). These tags are read-only and should NOT be modified manually in-game.

# Installation
- Step 1 Download this repository as a zip and unpack.
- Step 2 Go to minecraft saves directory, usually "C:/Users/youUserName/AppData/Roaming/.minecraft/saves".
- Step 3 Choose the world folder in which you want to install the packs.
- Step 4 Go to .../world/datapacks folder.
- Step 5 Move your "Damage-Datapack-Squid-Workshop-1.16.5" folder(not the root folder) into .../world/datapacks folder.
- Step 6 Open Minecraft and open the world.
- Step 7 Type "/reload" command then press enter.
- Step 8 Enjoy

PS: If not working, check whether the datapack is enabled by:

	/datapack list
Enable it by:

	/datapack enable "datapackname"
  
# Usage
You can use the selector or if-statement in command to check if players have the tags.
For example:

    /execute as @a[tags=jump_bool] run give @s minecraft:apple 1
This command gives an apple to the all the players that jumped.

These tags checks two types of actions: _Level_ and _Edge_. \
_Level_ actions == player is doing something\
Tags that checks _Level_ actions: (keep true whenever) player is doing something\
_Edge_ bools == (true for one tick if) player did something

The following is a list of all the tags:
| Name | Type | Meaning |
| --- | :------ | :------ |
| walk_bool      | level | is     walking
| walk_begin     | edge  | starts walking
| walk_end       | edge  | stops  walking
| shift_bool     | level | is     pressing shift
| shift_begin    | edge  | starts pressing shift
| shift_end      | edge  | stops  pressing shift
| sprint_bool    | level | is     sprinting
| sprint_begin   | edge  | starts sprinting
| sprint_end     | edge  | stops  sprinting
| sleep_bool     | level | is     sleeping
| sleep_begin    | edge  | starts sleeping
| sleep_end      | edge  | stops  sleeping
| shield_bool    | level | has shield in main or off hand
| jump_bool      | edge  | jumped
| bow_bool       | edge  | used bow
| crossbow_bool  | edge  | used crossbow
| pearl_bool     | edge  | used ender pearl
| offGrnd_begin  | edge  | lifted offground
| offGrnd_end    | edge  | landed
| carotClik      | edge  | right clicked using carrot stick
| fungiClik      | edge  | right clicked using fungus stick
| fishrClik      | edge  | right clicked using fish rod
| container_bool | edge  | interacted with a barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper
