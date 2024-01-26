##
 # disp_main.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
execute as @e[tag=sbounds.marker,tag=!sbounds.marker.locked,limit=1,sort=nearest] at @s run function sbounds:remove/display

function sbounds:chat/gen_menu
