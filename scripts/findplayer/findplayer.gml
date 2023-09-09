// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function findplayer(){
	var num = 0
	var playerfound=false
	repeat(instance_number(bufferobject))
	{
		inst=instance_find(bufferobject,num)
		if(inst.obj==player)
		{
			playerfound=true
		}
		num+=1
	}
	return playerfound;
}