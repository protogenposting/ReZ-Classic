/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y-1,wall))
{
	image_index=1
}
else
{
	image_index=0
}
col=instance_place(x,y,object_index)
if(col)
{
	col.y+=64*sign(player.grav)
}
if(place_meeting(x,y-1*sign(player.grav),player))
{
	if(player.iy[2]<0)
	{
		y+=64*sign(player.grav)
	}
}