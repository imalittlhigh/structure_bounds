##
 # display.mcfunction
 # 
 #
 # Created by imalittlhigh.
##

execute as @s[tag=sbounds.marker.pillager_outpost] at @s positioned ~-35 ~-27 ~-35 run kill @e[tag=sbounds.blockdisplay,limit=2,sort=nearest,distance=..2]
execute as @s[tag=sbounds.marker.ocean_monument] at @s positioned ~-29 ~-22 ~-29 run kill @e[tag=sbounds.blockdisplay,limit=2,sort=nearest,distance=..2]
execute as @s[tag=sbounds.marker.nether_fortress] at @s positioned ~-5 ~-5 ~-5 run kill @e[tag=sbounds.blockdisplay,limit=2,sort=nearest,distance=..2]

tag @s add sbounds.marker.locked