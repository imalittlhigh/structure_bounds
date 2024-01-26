##
 # spawn.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#add breakout
scoreboard players add %breakout sbounds.dummy 1

#randomzie what mob to spawn
execute store result score %rand.mob sbounds.dummy run random value 1..28
#spawn mob
execute if score %rand.mob sbounds.dummy matches 1..10 run summon blaze ~ ~ ~
execute if score %rand.mob sbounds.dummy matches 11..18 run summon wither_skeleton ~ ~ ~
execute if score %rand.mob sbounds.dummy matches 19..23 run summon zombified_piglin ~ ~ ~
execute if score %rand.mob sbounds.dummy matches 24..26 run summon magma_cube ~ ~ ~
execute if score %rand.mob sbounds.dummy matches 27..28 run summon skeleton ~ ~ ~

data modify entity @e[limit=1,sort=nearest,type=!marker,type=!block_display] Invulnerable set value 1b
tag @e[limit=1,sort=nearest,type=!marker,type=!block_display] add sbounds.new_entity

#spreadplayer mob in range of bounding box
#execute positioned over world_surface run spreadplayers ~ ~ 10 33 false @e[type=#sbounds:fortress_mobs,distance=..1,limit=1,sort=nearest]

#Manual Spreadplayers to work in nether
execute store result score %guardian.rand.x sbounds.dummy run random value -5..5
execute store result score %guardian.rand.y sbounds.dummy run random value -5..5
execute store result score %guardian.rand.z sbounds.dummy run random value -5..5

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



#check if block is spawnable, and mob is still in bounding box (cause of spreadplayer, if you build high up, it could "spawn" out of the bounding box)
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~-0.5 ~ #sbounds:fortress_mobs_spawnable run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~ ~ #sbounds:air run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s unless block ~ ~1 ~ #sbounds:air run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest,type=wither_skeleton] at @s unless block ~ ~2 ~ #sbounds:air run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest,type=wither_skeleton] at @s if block ~ ~-0.5 ~ wither_rose run tag @s remove sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest,type=magma_cube] at @s if predicate sbounds:magma_spawnable run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest,type=magma_cube] at @s if block ~ ~-0.5 ~ magma_block run tag @s remove sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest,type=zombified_piglin] at @s if block ~ ~-0.5 ~ magma_block run tag @s remove sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s if entity @a[distance=..24,tag=!sbounds.debug] run tag @s add sbounds.remove
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] at @s positioned ~-5 ~-5 ~-5 unless entity @e[tag=sbounds.marker.nether_fortress,dx=10,dy=10,dz=10] run tag @s add sbounds.remove
#remove mob if not spawnable
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run tp @s ~ -500 ~
execute as @e[tag=sbounds.remove,limit=1,sort=nearest] at @s run kill @s
#debug
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] run tellraw @a[tag=sbounds.debug] ["",{"text":"Spawned Nether Fortress Mob at [","color":"gray"},{"score":{"name":"%marker.pos.x","objective":"sbounds.dummy"},"color":"gray"},{"text":"/","color":"gray"},{"score":{"name":"%marker.pos.y","objective":"sbounds.dummy"},"color":"gray"},{"text":"/","color":"gray"},{"score":{"name":"%marker.pos.z","objective":"sbounds.dummy"},"color":"gray"},{"text":"]","color":"gray"}]
#if spawnable, remove one i
execute as @e[tag=sbounds.new_entity,limit=1,sort=nearest] run scoreboard players remove %rand sbounds.dummy 1


#remove invoulnerability
data modify entity @e[tag=sbounds.new_entity,limit=1,sort=nearest] Invulnerable set value 0b
#unmark as new
tag @e[tag=sbounds.new_entity,limit=1,sort=nearest] remove sbounds.new_entity

#if breakout, end function
execute if score %breakout sbounds.dummy matches 100.. run scoreboard players set %rand sbounds.dummy 0
#if more mobs needed, rerun funciton
execute if score %rand sbounds.dummy matches 1.. run function sbounds:running/nether_fortress/spawn