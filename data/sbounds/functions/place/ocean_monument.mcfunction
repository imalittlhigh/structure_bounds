##
 # ocean_monument.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
#debug
tellraw @a[tag=sbounds.debug] {"text":"Placing Ocean Monument","color":"gray"}
#spawn technical marker for box
execute align xyz run summon marker ~ ~ ~ {Tags:["sbounds.marker.ocean_monument","sbounds.marker","sbounds"]}
#regive menu
function sbounds:chat/gen_menu

#add visuals
function sbounds:visual/ocean_monument

#remove palce marker
kill @s

#dubug for box visual
execute as @e[tag=sbounds.marker,tag=sbounds.marker.debug] at @s run function sbounds:debug/remove_glowing
execute as @a[tag=sbounds.debug] at @s as @e[tag=sbounds.marker,distance=..50,tag=!sbounds.marker.debug] at @s run function sbounds:debug/add_glowing
