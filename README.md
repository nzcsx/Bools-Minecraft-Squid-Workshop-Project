# _Squid Workshop's_ Bools Data Pack

This folder is for global boolean variables. \
These bools translate player's actions game data into the form of tags. \
(Tagged == True, Untagged == False) \
Therefore these tags are read-only and should NOT be modified by anything outside this pack.

There are two types of bools: _Level_ and _Edge_. \
_Level_ bools == (keep true whenever) player is doing something\
_Edge_ bools == (true for one tick if) player did something

The following is a list of all the bools:
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
