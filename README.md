# _Squid Workshop's_ Bools Data Pack
A minecraft datapack library for global boolean system. Set scoreboard objectives xxx_bool to 1 when the players perform some actioins.

- [Abstract](#Abstract)
- [Installation](#Installation)
- [Usage](#Usage)
- [How It Works](#How-It-Works)
- [Project Tree](#Project-Tree)
- [Terms of Use](#Terms-of-Use)
- [More About Squid Workshop](#More-About-Squid-Workshop)

# Abstract
This data pack translates player actions into booleans. I chose to use scoreboard objectives to represent the booleans ({score=1} == True, {score=0} == False). These objective scores are read-only and should NOT be modified manually in-game.

# Installation
- Step 1 Download this repository as a zip and unpack.
- Step 2 Go to minecraft saves directory, usually "C:/Users/youUserName/AppData/Roaming/.minecraft/saves".
- Step 3 Choose the world folder in which you want to install the packs.
- Step 4 Go to .../world/datapacks folder.
- Step 5 Move your "Bools-Datapack-Squid-Workshop-1.16.5" folder(not the root folder) into .../world/datapacks folder.
- Step 6 Open Minecraft and open the world.
- Step 7 Type "/reload" command then press enter.
- Step 8 Enjoy

PS: If not working, check whether the datapack is enabled by:

	/datapack list
Enable it by:

	/datapack enable "datapackname"
  
# Usage
You can use the selector or if-statement in command to check if players have the tags.

- This command gives an apple to players that jumped:

	  /execute as @a[scores={jump_bool=1}] run give @s minecraft:apple 1
- This command gives 1 second regeneration effect to players that start sleeping:

	  /execute as @a[scores={sleep_begin=1}] run effect give @s minecraft:regeneration 1 1 true

These boolean scores check two types of actions: _Level_ and _Edge_. \
_Level_ action scores := (keep setting to 1 whenever) player is doing something\
_Edge_ action scores := (set to 1 for one tick if) player did something

The following is a list of all the scores:
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
| jump_bool      | edge  | jumped
| offGrnd_begin  | edge  | lifted offground
| offGrnd_end    | edge  | landed
| shield_bool    | level | has shield in main or off hand
| bow_bool       | edge  | used bow
| crossbow_bool  | edge  | used crossbow
| pearl_bool     | edge  | used ender pearl
| snowball_bool     | edge  | used ender pearl
| carotClik_bool | edge  | right clicked using carrot stick
| fungiClik_bool | edge  | right clicked using fungus stick
| fishrClik_bool | edge  | right clicked using fishing rod
| container_bool | edge  | interacted with a barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper

# How It Works
## Type 1
Type 1 includes: `walk_bool`, `shift_bool`, `sprint_bool`, `sleep_bool`, `jump_bool`, `bow_bool`, `crossbow_bool`, `pearl_bool`, `snowball_bool`, `carotClik_bool`, `fungiClik_bool`, `fishrClik_bool`, `sleep_bool`

Minecraft provides a lot of scores that automatically count the player actions (the amount of jumps, centimeters walked, etc). In another word, the game increments these scores automatically every time the player performs some actions. \
I use a set of `helper` scores to count those values. \
I use a set of `bool` scores to record the boolean output. \
Every time the `helper` increases above 0, I set `bool` to 1 and reset `helper` to 0. \
The logic is shown below:

	Loop per tick:
	    # Game updates helper #
	    
	    bool = 0
 	    if ( helper > 0 )
 	        bool = 1
	    helper = 0

## Type 2
Type 2 includes: `sleep_begin, sleep_end, offGrnd_begin, offGrnd_end`

`Begin` and `end` scores record the beginning tick and end tick of actions. Since both `begin` and `end` are edge scores, we first reset them to 0. Then we check how to set `begin` and `end`. \
If `bool` is 1 and `helper` > 0, meaning the player is not doing something in the previous tick but is doing it in the current tick, we set `begin` to 1. \
If `bool` is 0 and `helper` = 0, meaning the player is doing something in the previous tick but is not doing it in the current tick, we set `end` to 1. \
The logic is shown below:

	Loop per tick:
	    # Game updates helper #
	    
	    begin = 0
	    end = 0
	    if ( helper > 0 && bool = 0 )
	    	begin = 1
	    if ( helper = 0 && bool = 1 )
	    	end = 1
		
	    bool = 0
 	    if ( helper > 0 )
 	        bool = 1
	    helper = 0


## Type 3
Type 3 includes: `walk_begin, walk_end, shift_begin, shift_end, sprint_begin, sprint_end`

However there is some slight issue because it's actually wrong to assume that the game increments the `helper` EVERY tick as the player performs some continuous actions.
- Correct statement:  

      Total_amount_of_jumps increases at the tick the player jumps. 
- Incorrect statement: 
	
      Total_cm_walked will keep increasing every tick as the player keeps walking.

When a player is quickly turning or stops walking, there is a slowing down period. During such period, the total_cm_walked follows the pattern: unchanged for 3 ticks, increased for 1 tick. 

The way I solved it is rather simple. I check if to update `bool` once every 3 ticks instead of every tick. I also check if to update `begin`, `end` to 1 once every 3 ticks. Although I cannot eliminate such behavior, I minimized its negative effect. Therefore for those bools, the logic becomes:

	Loop per tick:
	    # Game updates helper #
	    timer switches among 1, 2, 3
	    
	    begin = 0
	    end = 0
	    
	    if ( timer == 1 )    
	    	if ( helper > 0 && bool = 0 )
	    	    begin = 1
	    	if ( helper = 0 && bool = 1 )
	    	    end = 1
		
	    	bool = 0
 	    	if ( helper > 0 )
 	           bool = 1
	    	helper = 0


## Others
The rest includes: `shield_bool, container_bool`

`shield_bool` simply checks players' nbt tag to see if they are holding shields. It does not use scoreboard system at all.

`container_bool` is similar to Type 1 scores. However, because there are multiple containers to consider, there are multiple `helpers`. \
`helper00` := barrel \
`helper01` := chest \
`helper02` := enderchest \
`helper03` := shulker_box \
`helper04` := trapped_chest \
`helper05` := blast_furnace \
`helper06` := furnace \
`helper07` := smoker \
`helper08` := dispenser \
`helper09` := dropper \
`helper10` := hopper \
The logic is shown below:

	Loop per tick:
	    # Game updates helper #
	    
	    bool = 0
	    unless ( helper00 == 0 && ... && helper10 == 0 )
	    	bool = 1
	    for helper00 to helper10
 	    	helper = 0
		
Ok. I swear I'll finish this before 2021/June/6 (if not I'll update this date)

# Project Tree
See [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject/blob/master/CONTRIBUTING.md) for our standard datapack structure and how this structure works.

	  Bools-Datapack-Squid-Workshop-1.16.5
	    │  pack.mcmeta
	    │  pack.png
	    │  
	    └─data
		├─app
		│  └─functions
		│      ├─help
		│      │       bools.mcfunction
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
		│          └─core
		│                  check_every_tick.mcfunction
		│                  check_three_ticks.mcfunction
		│                  
		└─minecraft
		    └─tags
			└─functions
				load.json
				tick.json

# Call Tree
	  /minecraft/tags/functions/tick.json
	    │  
	    └─/bools/functions/classes/main/tick.mcfunction
		│
		├─/bools/functions/classes/core/check_every_tick.mcfunction
		└─/bools/functions/classes/core/check_three_ticks.mcfunction
		
	  /minecraft/tags/functions/load.json
	    │  
	    └─/bools/functions/classes/main/load.mcfunction
		│
		└─/bools/functions/classes/main/clean.mcfunction

	  /app/functions/unload/bools.mcfunction
	    │  
	    └─/bools/functions/classes/main/clean.mcfunction
	    
	  /app/functions/help/bools.mcfunction


# Terms of Use
Feel free to play around with this datapack. \
As developer, feel free to use this datapack as a module to develop free datapacks. \
But you **must** add the link to this github page! \
**NO COMMERCIAL USE**
## License
[Mozilla Public License 2.0](https://github.com/nzcsx/Bools-Minecraft-Squid-Workshop-Project/blob/main/LICENSE)


# More About Squid Workshop
See more datapacks developed by us [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject) \
Watch our videos on bilibili [here](https://space.bilibili.com/649645265?from=search&seid=778816111336987286) \
Join our QQ group: 74681732 \
Subscribe on wechat: 鱿鱼MC工作室 
