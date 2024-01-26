##
 # bb_main.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
execute as @e[tag=sbounds.marker,limit=1,sort=nearest,tag=!sbounds.marker.locked] at @s run function sbounds:remove/bounding_box

function sbounds:chat/gen_menu