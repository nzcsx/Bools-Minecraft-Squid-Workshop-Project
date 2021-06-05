tellraw @p ["",{"text":"=================================================","color":"aqua"},{"text":"\n"},{"text":"Global bools translate player actions into scores.\n( {score=1} := true ; {score=0} := false )","color":"aqua"},{"text":"\n\n"},{"text":"There are two types: Level and Edge.\nLevel bools := (true whenever) player is doing something.\nEdge bools := (true for one tick) player did something.","color":"aqua"}]
tellraw @p [{"text":"","color":"aqua"},{"text":"Following is a list of all bools:\nName...........................Type........Meaning\nwalk_bool................level........is \u0020 \u0020 \u0020 walking\nwalk_begin.............edge.........starts walking\nwalk_end.................edge.........stops \u0020walking\nshift_bool...............level........is \u0020 \u0020 \u0020 pressing shift\nshift_begin............edge.........starts pressing shift\nshift_end................edge.........stops \u0020pressing shift\nsprint_bool............level........is \u0020 \u0020 \u0020 sprinting\nsprint_begin.........edge........starts sprinting\nsprint_end.............edge........stops \u0020sprinting"}]
tellraw @p [{"text":"","color":"aqua"},{"text":"sleep_bool..............level........is \u0020 \u0020 \u0020 sleeping\nsleep_begin...........edge........starts sleeping\nsleep_end...............edge........stops \u0020sleeping\njump_bool...............edge........jumped\noffGrnd_begin.....edge........lifted offground\noffGrnd_end.........edge........landed\nshield_bool.............level........has shield in main or off hand\nbow_bool..................edge.........used bow\ncrossbow_bool...edge.........used crossbow\npearl_bool..............edge........used ender pearl\ncarotClik...................edge........right clicked using carrot stick\nfungiClik.....................edge........right clicked using fungus stick\nfishrClik.....................edge........right clicked using fish rod"}]
tellraw @p [{"text":"","color":"aqua"},{"text":"container_bool....edge........interacted with a barrel/chest/enderchest/shulker_box/trap_chest//blast_furnace/furnace/smoker//dispenser/dropper/hopper\n=================================\n"}]