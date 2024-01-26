##
 # spawn.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#adding breakout condiditon
scoreboard players add %breakout sbounds.dummy 1
#spawning mob
summon guardian ~ ~ ~
data modify entity @e[limit=1,sort=nearest,type=!marker,type=!block_display] Invulnerable set value 1b
tag @e[limit=1,sort=nearest,type=!marker,type=!block_display] add sbounds.new_entity

#Manual Spreadplayers to work in water
execute store result score %guardian.rand.x sbounds.dummy run random value -28..28
execute store result score %guardian.rand.y sbounds.dummy run random value -22..0
execute store result score %guardian.rand.z sbounds.dummy run random value -28..28

execute store result score %marker.pos.x sbounds.dummy run data get entity @s Pos[0]
execute store result score %marker.pos.y sbounds.dummy run data get entity @s Pos[1]
execute store result score %marker.pos.z sbounds.dummy run data get entity @s Pos[2]

scoreboard players operation %marker.pos.x sbounds.dummy += %guardian.rand.x sbounds.dummy
scoreboard players operation %marker.pos.y sbounds.dummy += %guardian.rand.y sbounds.dummy
scoreboard players operation %marker.pos.z sbounds.dummy += %guardian.rand.z sbounds.dummy

execute store result storage sbounds:pos x double 1 run scoreboard players get %marker.pos.x sbounds.dummy
execute store result storage sbounds:pos y double 1 run scoreboard players get %marker.pos.y sbounds.dummy
execute store result storage sbounds:pos z double 1 run scoreboard players get %marker.pos.z sbounds.dummy

data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Pos[0] set from storage sbounds:pos x
data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Pos[1] set from storage sbounds:pos y
data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Pos[2] set from storage sbounds:pos z

#checking if block is spawnable
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~ ~ #sbounds:guardian_spawnable run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s if entity @a[distance=..24,tag=!sbounds.debug] run tag @s add sbounds.remove
#if not, remove mob
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run tp @s ~ -500 ~
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run kill @s
#debug
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] run tellraw @a[tag=sbounds.debug] ["",{"text":"Spawned Guardian at [","color":"gray"},{"score":{"name":"%marker.pos.x","objective":"sbounds.dummy"},"color":"gray"},{"text":"/","color":"gray"},{"score":{"name":"%marker.pos.y","objective":"sbounds.dummy"},"color":"gray"},{"text":"/","color":"gray"},{"score":{"name":"%marker.pos.z","objective":"sbounds.dummy"},"color":"gray"},{"text":"]","color":"gray"}]

#if spawnable, add one step to i
execute if entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] run scoreboard players remove %rand sbounds.dummy 1
#remove invoulnerable tag (this is here so they dont suffocate if tped in block)
data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Invulnerable set value 0b
#unmarking as new entity
tag @e[tag=sbounds.new_entity,limit=1,sort=nearest] remove sbounds.new_entity
#if breakout reached, end funciton
execute if score %breakout sbounds.dummy matches 100.. run scoreboard players set %rand sbounds.dummy 0
#if more entites need to be spawned, rerun funciton
execute if score %rand sbounds.dummy matches 1.. run function sbounds:running/ocean_monument/spawn