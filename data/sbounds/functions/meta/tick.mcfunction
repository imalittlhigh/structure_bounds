##
 # tick.mcfunction
 # 
 #
 # Created by imalittlhigh
##
#if spawnegg palced, place marker
execute as @e[tag=sbounds.marker.pillager_outpost.placed.new] at @s run function sbounds:place/pillager_outpost
execute as @e[tag=sbounds.marker.ocean_monument.placed.new] at @s run function sbounds:place/ocean_monument
execute as @e[tag=sbounds.marker.nether_fortress.placed.new] at @s run function sbounds:place/nether_fortress

#if u want particles with fortress boxes uncomment this
#execute as @e[tag=sbounds.marker.nether_fortress,tag=!sbounds.marker.locked] at @s run function sbounds:visual/particles/nether_fortress


#if need to process box, process one at a time to reduce problems and lag
execute as @e[tag=sbounds.process,limit=1,sort=random] at @s run function sbounds:running/main


