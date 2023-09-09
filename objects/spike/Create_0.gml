/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
if layer_background_get_sprite(back_id) == Sprite22
{
    sprite_index=roccspike
}
image_speed=0
falling=false
if(vspeed==0&&hspeed==0)
{
	if(place_meeting(x+64,y,wall))
	{
		image_angle=90
	}
	if(place_meeting(x,y-64,wall))
	{
		image_angle=180
	}
	if(place_meeting(x,y+64,wall))
	{
		image_angle=0
	}
	if(place_meeting(x-64,y,wall))
	{
		image_angle=270
	}
}