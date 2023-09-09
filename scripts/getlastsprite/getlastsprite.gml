// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getlastsprite(){
	var num=0
	var lsprite=0
	repeat(1000)
	{
	if(!sprite_exists(num))
	{
		lsprite=num-1
		break;
	}
	num+=1
	}
	return lsprite
}