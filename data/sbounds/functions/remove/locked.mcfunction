##
 # locked.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

execute as @e[tag=sbounds.marker.locked,limit=1,sort=nearest] at @s run kill @e[tag=sbounds.blockdisplay.box.debug,limit=1,sort=nearest,distance=..1]

execute as @e[tag=sbounds.marker.locked,limit=1,sort=nearest] run kill @s

function sbounds:chat/gen_menu
