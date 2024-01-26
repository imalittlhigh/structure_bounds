##
 # spawn.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#add breakout
scoreboard players add %breakout sbounds.dummy 1
#spawn mob
summon pillager ~ ~ ~
data modify entity @e[limit=1,sort=nearest,type=!marker,type=!block_display] Invulnerable set value 1b
tag @e[limit=1,sort=nearest,type=!marker,type=!block_display] add sbounds.new_entity
#spreadplayer mob in range of bounding box
spreadplayers ~ ~ 10 33 false @e[limit=1,sort=nearest,tag=sbounds.new_entity]
#check if block is spawnable, and mob is still in bounding box (cause of spreadplayer, if you build high up, it could "spawn" out of the bounding box)
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~-0.5 ~ #sbounds:pillager_spawnable run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~ ~ #sbounds:air run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~1 ~ #sbounds:air run tag @s add sbounds.remov
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s if entity @a[distance=..24,tag=!sbounds.debug] run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s positioned ~-35 ~-27 ~-35 unless entity @e[tag=sbounds.marker.pillager_outpost,dx=71,dy=71,dz=54] run tag @s add sbounds.remove
#remove mob if not spawnable
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run tp @s ~ -500 ~
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run kill @s
#debug
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] run tellraw @a[tag=sbounds.debug] ["",{"text":"Spawned Pillager","color":"gray"}]

#if spawnable, remove one i
execute if entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] run scoreboard players remove %rand sbounds.dummy 1
#remove invoulnerability
data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Invulnerable set value 0b
#unmark as new
tag @e[tag=sbounds.new_entity,limit=1,sort=nearest] remove sbounds.new_entity
#if breakout, end function
execute if score %breakout sbounds.dummy matches 100.. run scoreboard players set %rand sbounds.dummy 0
#if more mobs needed, rerun funciton
execute if score %rand sbounds.dummy matches 1.. run function sbounds:running/pillager_outpost/spawn