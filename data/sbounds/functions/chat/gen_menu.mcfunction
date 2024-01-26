##
 # gen_menu.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
tellraw @a ["",{"text":"-------------------","color":"gold"},{"text":"\n"},{"text":"Remove closest not locked Bounding Box","color":"red","clickEvent":{"action":"run_command","value":"/execute as @s at @s run function sbounds:remove/bb_main"},"hoverEvent":{"action":"show_text","contents":"Completely removes closest Bounding Box"}},{"text":"\n\n"},{"text":"Confirm closest Bounding Box","color":"dark_green","clickEvent":{"action":"run_command","value":"/execute as @s at @s run function sbounds:remove/disp_main"},"hoverEvent":{"action":"show_text","contents":"Removes the Visual Display"}},{"text":"\n\n"},{"text":"Remove closest locked Bounding Box","color":"red","clickEvent":{"action":"run_command","value":"/execute as @s at @s run function sbounds:remove/locked"},"hoverEvent":{"action":"show_text","contents":"Removes locked Bounding Box"}},{"text":"\n\n"},{"text":"Get Bounding Box give menu","color":"blue","clickEvent":{"action":"run_command","value":"/function sbounds:chat/give_menu"},"hoverEvent":{"action":"show_text","contents":"Get the menu for all Bounding Box placers"}},{"text":"\n"},{"text":"-------------------","color":"gold"}]
