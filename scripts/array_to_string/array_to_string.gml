// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_to_string(array){
	var num=0
	var str = ""
	repeat(array_length(array))
	{
		str = str+string(array[num])+","
		num+=1
	}
	return str
}