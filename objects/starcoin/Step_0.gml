/// @description Insert description here
// You can write your code in this editor
if(player.onground&&distance_to_object(player)<64)
{
	collect()
}
else if(following)
{
	x-=(x-player.x)/60
	y-=(y-player.y)/60
}
else if(!following)
{
	x-=(x-xstart)/60
	y-=(y-ystart)/60
}