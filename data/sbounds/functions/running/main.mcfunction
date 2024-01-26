##
 # main.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#debug
tellraw @a[tag=sbounds.debug] {"text":"Running Main Spawning Check","color":"gray"}
#check players in corresponding dimension
execute at @s[predicate=sbounds:overworld] store result score %playercount.overworld sbounds.dummy if entity @a[predicate=sbounds:overworld]
execute at @s[predicate=sbounds:nether] store result score %playercount.nether sbounds.dummy if entity @a[predicate=sbounds:nether]

#overworld
#check mobs counting toward mobcap
execute if score %playercount.overworld sbounds.dummy matches 1.. store result score %mobs.overworld sbounds.dummy at @a[predicate=sbounds:overworld] if entity @e[type=#sbounds:counts_to_mobcap,nbt=!{PersistenceRequired:1b}]
#save 70 cap to player cap for calc
execute if score %playercount.overworld sbounds.dummy matches 1.. run scoreboard players operation %mobcap.overworld sbounds.dummy = %mobcap.perplayer sbounds.dummy
#calc cap for all players (70 * playercount overworld)
execute if score %playercount.overworld sbounds.dummy matches 1.. run scoreboard players operation %mobcap.overworld sbounds.dummy *= %playercount.overworld sbounds.dummy

#nether
#check mobs counting toward mobcap
execute if score %playercount.nether sbounds.dummy matches 1.. store result score %mobs.nether sbounds.dummy at @a[predicate=sbounds:nether] if entity @e[type=#sbounds:counts_to_mobcap]
#save 70 cap to player cap for calc
execute if score %playercount.nether sbounds.dummy matches 1.. run scoreboard players operation %mobcap.nether sbounds.dummy = %mobcap.perplayer sbounds.dummy
#calc cap for all players (70 * playercount nether)
execute if score %playercount.nether sbounds.dummy matches 1.. run scoreboard players operation %mobcap.nether sbounds.dummy *= %playercount.nether sbounds.dummy

#check to not overpopulate the area:
execute as @s[tag=sbounds.marker.pillager_outpost] at @s store result score %pillagercount sbounds.dummy if entity @e[type=pillager,distance=..128,nbt=!{PersistenceRequired:1b}]
execute as @s[tag=sbounds.marker.ocean_monument] at @s store result score %guardiancount sbounds.dummy if entity @e[type=guardian,distance=..128,nbt=!{PersistenceRequired:1b}]
execute as @s[tag=sbounds.marker.nether_fortress] at @s store result score %netherfortressmobcount sbounds.dummy if entity @e[type=#sbounds:fortress_mobs,distance=..128,nbt=!{PersistenceRequired:1b}]

#if players in overworld, and mobcap higher than current mobs run spawning
execute if score %playercount.overworld sbounds.dummy matches 1.. at @s[predicate=sbounds:overworld] if score %mobcap.overworld sbounds.dummy > %mobs.overworld sbounds.dummy if score %pillagercount sbounds.dummy matches ..12 as @s[tag=sbounds.marker.pillager_outpost] run function sbounds:running/pillager_outpost/main
execute if score %playercount.overworld sbounds.dummy matches 1.. at @s[predicate=sbounds:overworld] if score %mobcap.overworld sbounds.dummy > %mobs.overworld sbounds.dummy if score %guardiancount sbounds.dummy matches ..25 as @s[tag=sbounds.marker.ocean_monument] run function sbounds:running/ocean_monument/main
execute if score %playercount.overworld sbounds.dummy matches 1.. at @s[predicate=sbounds:overworld] if score %mobcap.overworld sbounds.dummy > %mobs.overworld sbounds.dummy if score %netherfortressmobcount sbounds.dummy matches ..25 as @s[tag=sbounds.marker.nether_fortress] run function sbounds:running/nether_fortress/main
#if players in nether, and mobcap higher than current mobs run spawning
execute if score %playercount.nether sbounds.dummy matches 1.. at @s[predicate=sbounds:nether] if score %mobcap.nether sbounds.dummy > %mobs.nether sbounds.dummy if score %pillagercount sbounds.dummy matches ..15 as @s[tag=sbounds.marker.nether_fortress] run function sbounds:running/nether_fortress/main
execute if score %playercount.nether sbounds.dummy matches 1.. at @s[predicate=sbounds:nether] if score %mobcap.nether sbounds.dummy > %mobs.nether sbounds.dummy if score %guardiancount sbounds.dummy matches ..25 as @s[tag=sbounds.marker.pillager_outpost] run function sbounds:running/pillager_outpost/main
execute if score %playercount.nether sbounds.dummy matches 1.. at @s[predicate=sbounds:nether] if score %mobcap.nether sbounds.dummy > %mobs.nether sbounds.dummy if score %netherfortressmobcount sbounds.dummy matches ..45 as @s[tag=sbounds.marker.ocean_monument] run function sbounds:running/ocean_monument/main

tag @s remove sbounds.process