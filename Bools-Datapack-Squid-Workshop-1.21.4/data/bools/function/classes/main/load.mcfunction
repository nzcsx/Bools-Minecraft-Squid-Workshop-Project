########################################
# Remove all the objectives and tags
function bools:classes/main/clean



########################################
# Create all the helper variables
function bools:classes/walk/load
function bools:classes/sprint/load

function bools:classes/sleep/load
function bools:classes/shift/load
function bools:classes/jump/load
function bools:classes/offgrnd/load

function bools:classes/shield/load
function bools:classes/bow/load
function bools:classes/crossbow/load
function bools:classes/pearl/load
function bools:classes/snowball/load

function bools:classes/carotclik/load
function bools:classes/fungiclik/load
function bools:classes/fishrclik/load

function bools:classes/container/load



########################################
# Create bools timer variables
scoreboard objectives add bools dummy
scoreboard players set timer bools 1

########################################
# Loading message
tellraw @a {"text":"[Server]: Bools-Datapack from Squid-Workshop Loaded","italic":true,"color":"gray"}