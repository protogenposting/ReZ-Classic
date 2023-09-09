/// @description Insert description here
// You can write your code in this editor
ogroom=room
if(roomidui.starcoinscollected[ogroom])
{
	instance_destroy()
}
following=false
collect=function(){
	roomidui.starcoinscollected[ogroom]=true
	roomidui.starcoins+=1
	instance_destroy()
	effect_create_above(ef_star,x,y,1,c_yellow)
	audio_play_sound(starget,1000,false)
}
target=player

for (var i = 0; i < instance_number(starcoin); ++i;)
{
    if(id== instance_find(starcoin,i))
	{
		num=i
	}
}