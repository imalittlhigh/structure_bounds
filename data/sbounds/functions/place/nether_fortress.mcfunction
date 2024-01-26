##
 # pillager_outpost.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#debug
tellraw @a[tag=sbounds.debug] {"text":"Placing Nether Fortress","color":"gray"}
#place technical marker
execute align xyz run summon marker ~ ~ ~ {Tags:["sbounds.marker.nether_fortress","sbounds.marker","sbounds"]}
#regive menu
function sbounds:chat/gen_menu

#add visual
function sbounds:visual/nether_fortress

#remove place marker
kill @s

#dubug for box visual
execute as @e[tag=sbounds.marker,tag=sbounds.marker.debug] at @s run function sbounds:debug/remove_glowing
execute as @a[tag=sbounds.debug] at @s as @e[tag=sbounds.marker,distance=..50,tag=!sbounds.marker.debug] at @s run function sbounds:debug/add_glowing
