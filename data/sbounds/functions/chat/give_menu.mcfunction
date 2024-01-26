##
 # give_menu.mcfunction
 # 
 #
 # Created by imalittlhigh.
##
tellraw @a ["",{"text":"-------------------","color":"gold"},{"text":"\nGive:\n"},{"text":"- Pillager Outpost","italic":true,"clickEvent":{"action":"run_command","value":"/function sbounds:give/pillager_outpost"}},{"text":"\n","italic":true},{"text":"- Ocean Monument","italic":true,"clickEvent":{"action":"run_command","value":"/function sbounds:give/ocean_monument"}},{"text":"\n","italic":true},{"text":"- Nether Fortress","italic":true,"clickEvent":{"action":"run_command","value":"/function sbounds:give/nether_fortress"}},{"text":"\n"},{"text":"-------------------","color":"gold"}]