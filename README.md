# _Squid Workshop's_ Bools Data Pack
A minecraft datapack library for global boolean system, which translates player's in-game actions into the form of scoreboard tags.

- [Abstract](#Abstract)
- [Installation](#installation)
- [Usage](#Usage)
- [Mechanism](#Mechanism)
- [Project Tree](#Project-Tree)
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
You can use the selector or if-statement in command to check if players have the tags. \
e.g.\
    /execute as @a[tags=jump_bool] run give @s minecraft:apple 1
This command gives an apple to all the players that jumped.

These tags check two types of actions: _Level_ and _Edge_. \
_Level_ action tags == (keep tagged whenever) player is doing something\
_Edge_ action tags == (tag for one tick if) player did something\

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

# Mechanism
Ok. I swear I'll update this before 2021/May/23 (if not I'll update this date)

# Project Tree
See [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject/blob/master/CONTRIBUTING.md) for our standard datapack structure and how this structure works.

	  Bools-Datapack-Squid-Workshop-1.16.5
	    │  pack.mcmeta
	    │  pack.png
	    │  
	    └─data
		├─app
		│  └─functions
		│      │  help.mcfunction
		│      │  
		│      └─unload
		│              bools.mcfunction
		│              
		├─bools
		│  └─functions
		│      └─classes  
		│          ├─main
		│          │       clean.mcfunction
		│          │       load.mcfunction
		│          │       tick.mcfunction
		│          └─bools
		│                  check_every_tick.mcfunction
		│                  check_three_ticks.mcfunction
		│                  
		└─minecraft
		    └─tags
			└─functions
				load.json
				tick.json

# Terms of Use
Feel free to play around with this datapack. \
As developer, deel free to use this datapack as a module to develop free datapacks. \
But you **must** add the link to this github page! \
**NO COMMERCIAL USE**
## License
[Mozilla Public License 2.0](https://github.com/nzcsx/Bools-Minecraft-Squid-Workshop-Project/blob/main/LICENSE)


# More About Squid Workshop
See more datapacks developed by us [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject) \
Watch our videos on bilibili [here](https://space.bilibili.com/649645265?from=search&seid=778816111336987286) \
Join our QQ group: 74681732 \
Subscribe on wechat: 鱿鱼MC工作室 
