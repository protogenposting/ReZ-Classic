/// @description Insert description here
// You can write your code in this editor
draw_self()
if(distance_to_object(player)<1000)
{
var ang=point_direction(x,y,player.x,player.y)
draw_sprite_ext(ak47,0,x+lengthdir_x(kb,ang+180),y+lengthdir_y(kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
}
if(distance_to_object(player)<500)
{
	xtarg-=(xtarg-player.xprevious)/10
	ytarg-=(ytarg-player.yprevious)/10
	draw_line(x,y,xtarg,ytarg)
	if(collision_line(x,y,xtarg,ytarg,player,true,true))
	{
		inst=instance_create_depth(player.x,player.y,depth,spike)
		inst.alarm[0]=2
	}
}
else
{
	xtarg-=(xtarg-x)/10
	ytarg-=(ytarg-y)/10
}