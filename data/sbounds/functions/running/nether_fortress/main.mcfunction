##
 # main.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

#unmark marker as "to process"
tag @s remove sbounds.process
#randomize mob spawn count
execute store result score %rand sbounds.dummy run random value 1..4
#reset the breakout variable
scoreboard players reset %breakout sbounds.dummy

#debug
tellraw @a[tag=sbounds.debug] ["",{"text":"Trying to spawn ","color":"gray"},{"score":{"name":"%rand","objective":"sbounds.dummy"},"color":"gray"},{"text":" Nether Fortress Mobs","color":"gray"}]

#run spawning
function sbounds:running/nether_fortress/spawn