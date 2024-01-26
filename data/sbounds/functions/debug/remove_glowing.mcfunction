##
 # remove_glowing.mcfunction
 # 
 #
 # Created by imalittlhigh.
##


kill @e[tag=sbounds.blockdisplay.box.debug,limit=1,sort=nearest,distance=..1]
tag @s remove sbounds.marker.debug