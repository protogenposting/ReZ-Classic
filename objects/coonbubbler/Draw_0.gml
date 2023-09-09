/// @description Insert description here
// You can write your code in this editor
draw_self()
if(distance_to_object(player)<1000)
{
var ang=point_direction(x,y,player.x,player.y)
draw_sprite_ext(bubbler,0,x+lengthdir_x(kb,ang+180),y+lengthdir_y(kb,ang+180),1,-sign((mouse_x<x)-0.5),ang,c_white,1)
}
if(distance_to_object(player)<500)
{
	draw_line(x,y,x+lengthdir_x(500,point_direction(x,y,player.x,player.y)),y+lengthdir_y(500,point_direction(x,y,player.x,player.y)))
}