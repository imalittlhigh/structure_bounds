##
 # 10s.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#debug
tellraw @a[tag=sbounds.debug] {"text":"Resetting Spawning Clock","color":"gray"}
#check for gamerule domobspawning
scoreboard players reset %gamerule.domobspawning sbounds.dummy
execute store result score %gamerule.domobspawning sbounds.dummy run gamerule doMobSpawning
#unless gamerule is set to 0, run spawning
execute if score %gamerule.domobspawning sbounds.dummy matches 1 run tag @e[tag=sbounds.marker.locked] add sbounds.process


#dubug for box visual
execute as @e[tag=sbounds.marker,tag=sbounds.marker.debug] at @s run function sbounds:debug/remove_glowing
execute as @a[tag=sbounds.debug] at @s as @e[tag=sbounds.marker,distance=..50,tag=!sbounds.marker.debug] at @s run function sbounds:debug/add_glowing

#rerun this function
schedule function sbounds:meta/2s 2s replace
