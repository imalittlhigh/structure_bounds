##
 # add_glowing.mcfunction
 # 
 #
 # Created by imalittlhigh.
##


summon block_display ~ ~ ~ {Glowing:1b,width:1f,height:1f,Tags:["sbounds","sbounds.blockdisplay.box.debug"],block_state:{Name:"minecraft:spawner"}}
tag @s add sbounds.marker.debug
