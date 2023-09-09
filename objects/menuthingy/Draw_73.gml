/// @description Insert description here
// You can write your code in this editor




if(keyboard_check_pressed(ord("H")))
{
	hitbox=!hitbox
}
if(hitbox)
{
	with(all)
	{
		draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true)
	}
}