# _Squid Workshop's_ Bools Data Pack
A [minecraft datapack](https://minecraft.fandom.com/wiki/Data_Pack) for global boolean system, setting scoreboard objectives xxx_bool to 1 when the players perform some actioins.

- [Abstract](#Abstract)
- [Installation](#Installation)
- [Usage](#Usage)
- [Mechanism](#Mechanism)
- [Project Tree](#Project-Tree)
- [Call Tree](#Call-Tree)
- [FAQ](#FAQ)
- [Terms of Use](#Terms-of-Use)
- [More About Squid Workshop](#More-About-Squid-Workshop)

# Abstract
This data pack translates player actions into booleans. I chose to use scoreboard objectives to represent the booleans ({score=1} == True, {score=0} == False). These objective scores are read-only and should NOT be modified manually in-game.

# Installation
## Install
- Step 1 Download "Bools-Datapack-Squid-Workshop-1.16.5.zip".
- Step 2 Go to minecraft saves directory, usually "C:/Users/youUserName/AppData/Roaming/.minecraft/saves".
- Step 3 Choose the world folder in which you want to install the packs.
- Step 4 Go to ../datapacks folder.
- Step 5 Move "Bools-Datapack-Squid-Workshop-1.16.5.zip" into ../datapacks folder.
- Step 6 Open Minecraft and open the world.
- Step 7 Type '/reload" command then press enter.
- Step 8 Enjoy

PS: If not working, check whether the datapack is enabled by:

	/datapack list
Enable it by:

	/datapack enable "datapackname"

## Uninstall
- Step 1 Delete the zip file from ../datapacks folder.
- Step 2 Use command:

	  /function app:unload/bools
This automatically deletes all the scoreboard objectives created in this datapack. 


# Usage
You can use the selector or if-statement in repeating command to check if players have the scores. Try running the commands below in a repeating command block. 

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
| snowball_bool  | edge  | used snowball
| carotClik_bool | edge  | right clicked using carrot stick
| fungiClik_bool | edge  | right clicked using fungus stick
| fishrClik_bool | edge  | right clicked using fishing rod
| container_bool | edge  | interacted with a <br />barrel / chest / enderchest / shulker_box / trap_chest / <br />blast_furnace / furnace / smoker / <br />dispenser / dropper / hopper

# Mechanism
## Scoreboard Criteria
First of all I want to talk about how those scoreboard criteria works. Say, we create a new scoreboard objective like this:

`/scoreboard objectives add walk_meter minecraft.custom:minecraft.walk_one_cm`

`walk_meter` is the objective name. `minecraft.custom:minecraft.walk_one_cm`  is the criterion. Now if a player starts walking, this player's  objective score increments, indicating how many centimeters they have  walked. (You can display the scoreboard on sidebar here using `/scoreboard objectives setdisplay sidebar walk_meter`)

![walk_meter](README_media/walk_meter.PNG)

Another example would be a jump counter.

`/scoreboard objectives add jump_counter minecraft.custom:minecraft.jump`

Now if a player jumps, this player's objective score increments, indicating how many jumps they have... well, jumped.

![jump_counter](README_media/jump_counter.PNG)

There  are multiple criteria we can play with, and we are going to make boolean walking, jumping detectors out of those later. However, I'd like  to draw a distinction here between two concepts..._edge_ and _level_

## Level & Edge Scores
Now imagine we somehow successfully create a boolean walking detector and a boolean jumping detector. If a player keeps walking, the walking score will continuously be 1. If players jumps and jumps and jumps, the score will be 1 only at the tick the player is jumping. In other words, the walking detector is continuous, and the jump detector is a pulse.

We call the continuous ones _level_ scores, and the pulsing ones _edge_ scores.

Also imagine if we somehow even managed to create a boolean starts-walking,  stops-walking detector (And spoiler alert: we can! ), they will be _edge_ scores too!

This piece of information is actually not that important to how to implement the detectors, but it helps us understand how to use those detectors. 

## Minecraft Game Update Hierarchy
When it comes to command, in every tick, the game processes stuffs in the following hierachy: 
1. Player action and inherent game mechanism. 
2. Minecraft functions. 
3. Minecraft command blocks. 

Keep this in mind, not only for the sake of this post, but also for your future projects. Now without further ado, let's jump right into the logics.

## Key Idea
Now let's give `walk_meter`, `jump_counter`, etc a common name - `xxx_helper`.  The key idea of a boolean detector is that we keep resetting the helper  every tick. If the helper stays zero, the player is not taking any action. If the counter rises above zero, the player is doing stuffs.

And here is a little piece of pseudo code to help us understand the logic:

```
Loop per tick:

    # Game updates helper #

    bool = 0 
    if ( helper > 0 ): 
        bool = 1 
    helper = 0
```

The game updates the helper objective scores as an inherent game mechanism. After that, we need three command blocks to implement the loop. 

## Type 1

Type 1 includes: `jump_bool`, `bow_bool`, `crossbow_bool`, `pearl_bool`, `snowball_bool`, `carotClik_bool`, `fungiClik_bool`, `fishrClik_bool` 

Notice how `walk_bool`, `shift_bool`, and `sprint_bool` are missing from the list, and all of the Type 1 scores are _edge_ scores? We are going to explain why in detail in Type 4 section. For now, just know that Type 1 is exactly the same as the key idea above. 

```
Loop per tick:

    # Game updates helper #
    
    bool = 0
    if ( helper > 0 )
	bool = 1
    helper = 0
```

## Type 2
Type 2a includes: `sleep_bool`, `shift_bool`\
Type 2b includes: `sleep_begin`, `sleep_end`, `shift_begin`, `shift_end`,

This type is the continuous variant of Type 1. `sleep_helper` is updated by fetching value from player `SleepTimer` nbt tag (which is updated by game). `shift_helper` is updated by game directly.

Now with those out of the way, let's finally take a look at the logic behind `xxx_begin` and `xxx_end`: 

```
Loop per tick:

    # Fame updates helper #

    begin = 0
    end = 0
    if ( helper > 0 && bool == 0 )
    	begin = 1
    if ( helper == 0 && bool == 1 )
    	end = 1

    bool = 0
    if ( helper > 0 )
        bool = 1
    helper = 0
```

The last four lines, which pertain to the `bool` update, are exactly the same as Type 1.

So let's try to understand `begin` and `end`. The idea is that we use `bool` as an indicator of state in previous tick, and `helper` as an indicator of state in current tick. 

If `bool` is 0 and `helper` > 0, meaning the player was previously not doing it, but now doing it, then the action begins! \
If `bool` is 1 and `helper` = 0, meaning the player was previously doing it, but now not doing it, then the action ends! \

Using this method we manage to update `begin` and `end`. 

## Type 3
Type 3b includes: `offGrnd_begin`, `offGrnd_end`

Note how there is no Type 3a `offGrnd_bool`. This is because the one can directly check the `OnGround` nbt tag of a player using the command `/execute as playerName if entity @s[nbt={OnGround:true}] run say I'm on Ground!` Hence, the `offGrnd_bool` isn't necessary! 

In this case, since `OnGround` nbt tag is updated by game automatically, we don't need to update `OffGrnd_bool` score manually. 

As for the `begin` and `end`: This also means we need to use `OnGround` as an indicator of state of current tick (Because the Game Update Hierachy dictates that nbt tags are parsed before functions, and reflects the accurate status quo of the player. ) 

Since we already have an indicator of current state, we can just use `offGrnd_helper` as a previous state indicator. We just manually update the `offGrnd_helper` using `OnGround` nbt tag. 

```
Loop per tick:
    
    # Game updates OnGround #

    begin = 0
    end = 0
    if ( helper > 0 && OnGround == false )
    	begin = 1
    if ( helper = 0 && OnGround == true )
    	end = 1

    if (OnGround == false)
    	helper = 1
    if (OnGround == true)
    	helper = 0
```

## Type 4
Type 4a includes: `walk_bool`, `sprint_bool` \
Type 4b includes: `walk_begin`, `walk_end`, `sprint_begin`, `sprint_end`

At first glance, they should be pretty straightforward. Why not just reuse the logic for begin and end we used before? 

Unfortunately, `helper` scores record in integer centimeters, which means it is possible to have a zero increment dispite player's action.

In order to avoid such issue, the workaround is updating `helper` and `bool` less frequently. I update them once every three ticks instead of once every tick. This is from my observation that such irragularity doesn't last more than 2 ticks. Although I cannot eliminate such behavior, I minimized its negative effect. 

Hence now, the logic becomes:

```
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
```
Note how I used a timer to implement "once every three ticks". 

## Others
The rest includes: `shield_bool`, `container_bool`

`shield_bool` checks players' nbt tag to see if they are holding shields either in main hand or offhand. It does not use any helper at all. The logic is simply this:

```
shield_bool = 0
if (shield in main hand)
	shield_bool = 1
if (shield offhand)
	shield_bool = 1
```

`container_bool` is similar to Type 1 scores. However, a `helper` is being updated by advancement instead of scoreboard. \

The logic is shown below:
```
Loop per tick:

    # Game updates advancement, which may trigger helper=1 #

    bool = helper
	helper = 0
```

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
			│      │      bools.mcfunction
			│      │      
			│      └─unload
			│             bools.mcfunction
			│              
			├─bools
			│  └─functions
			│      └─classes
			│          ├─main
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─bow
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─carotclik
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─container
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      trigger.mcfunction
			│          │      
			│          ├─crossbow
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─fishrclik
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─fungiclik
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─jump
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─offgrnd
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─pearl
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─shield
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─sleep
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─snowball
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─shift
			│          │      clean.mcfunction
			│          │      load.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          ├─sprint
			│          │      clean.mcfunction
			│          │      every_tick.mcfunction
			│          │      load.mcfunction
			│          │      three_ticks.mcfunction
			│          │      tick.mcfunction
			│          │      
			│          └─walk
			│                 clean.mcfunction
			│                 every_tick.mcfunction
			│                 load.mcfunction
			│                 three_ticks.mcfunction
			│                 tick.mcfunction
			│                  
			└─minecraft
				└─tags
				└─functions
					load.json
					tick.json

# Call Tree
	  /minecraft/tags/functions/tick.json
		├─ bools:container.json advancement
		│	└─ bools:classes/container/trigger
		│
	    └─ bools:classes/main/tick
			├─ bools:classes/bow/tick
			├─ bools:classes/carotclik/tick
			├─ bools:classes/container/tick
			├─ bools:classes/crossbow/tick
			├─ bools:classes/fishrclik/tick
			├─ bools:classes/fungiclik/tick
			├─ bools:classes/jump/tick
			├─ bools:classes/offgrnd/tick
			├─ bools:classes/pearl/tick
			├─ bools:classes/shield/tick
			├─ bools:classes/sleep/tick
			├─ bools:classes/snowball/tick
			├─ bools:classes/shift/tick
			├─ bools:classes/sprint/tick
			│	├─ bools:classes/sprint/every_tick
			│	└─ bools:classes/sprint/three_tick
			└─ bools:classes/walk/tick
				├─ bools:classes/walk/every_tick
				└─ bools:classes/walk/three_tick
			
	  /minecraft/tags/functions/load.json
	    └─ bools:classes/main/load
	        ├─ bools:classes/main/clean
	        ├─ bools:classes/bow/load
	        ├─ bools:classes/carotclik/load
	        ├─ bools:classes/container/load
	        ├─ bools:classes/crossbow/load
	        ├─ bools:classes/fishrclik/load
	        ├─ bools:classes/fungiclik/load
	        ├─ bools:classes/jump/load
	        ├─ bools:classes/offgrnd/load
	        ├─ bools:classes/pearl/load
	        ├─ bools:classes/shield/load
	        ├─ bools:classes/sleep/load
	        ├─ bools:classes/snowball/load
	        ├─ bools:classes/shift/load
	        ├─ bools:classes/sprint/load
	        └─ bools:classes/walk/load



# FAQ
Q: I don't know how to use GitHub. How can I download it? \
A: On this GitHub page, you can see a Releases section on the right. Click it, which directs to the Releases page. Then click the Bools-Datapack-Squid-Workshop-1.16.5.zip file to download.



Q: What version of the game is it compatible with? \
A: I wrote the pack in 1.16.5, and it is compatible upto at least 1.19.1 (and the foreseeable future versions). The syntax used are pretty basic, and I don't expect Mojang to make any big changes in the future.



Q: We created a lot of scoreboard objectives. Are they still there after I uninstall? \
A: If we follow the instruction in the GitHub page, all of the objectives will be deleted. If we made a mistake while uninstalling, we can simply reinstall and uninstall it again.



Q: Why don't we use scoreboard tags instead of scoreboard objectives? \
A: Because when we don't want to play with these scores anymore, we can just delete them. If we use tags, we cannot remove the tags on the players who are not online, which can cause trouble.



Q: What is the meaning of life? \
A: \[Redacted\]



Q: What if I want more bools? \
A: You can add your own function under the tag `#bools:tick`(i.e. `data/bools/tags/function/tick.json`) inside your own data pack. This will automatically make your functions run by this data pack.



Q: Can I modify your pack to suit my need? \
A: Yes you can. The datapack is under Mozilla Public License 2.0. However, please don't copy paste the code without acknowledging the source.



Q: What inspired you to make this datapack? \
A: I was tired of writing same pieces of code for every datapack I made. Plus, I don't like adding a bunch of redundant scoreboard objectives for every datapack. So I decided to make an API datapack for everyone to use.



Q: I have more questions! \
A: Again you can create "issues" here on GitHub to make a suggestion. 


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
