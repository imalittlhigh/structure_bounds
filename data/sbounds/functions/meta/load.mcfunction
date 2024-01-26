##
 # load.mcfunction
 # 
 #
 # Created by imalittlhigh
##
#adding needed scoreboards and values
scoreboard objectives add sbounds.dummy dummy
#adding mobcap value
scoreboard players set %mobcap.perplayer sbounds.dummy 70
#setting init storage
data modify storage sbounds:value rand set value 0
data modify storage sbounds:pos x set value 0
data modify storage sbounds:pos y set value 0
data modify storage sbounds:pos z set value 0
