 /// @description Insert description here
// You can write your code in this editor
if(room>cutscene1&&ballsmode&&instance_exists(player))
{
instance_create_depth(x,y,depth,objLightController)
}
instance_create_depth(x,y,0,mouseboi)
if(room==editor)
{
	camera_set_view_target(view_camera[0],mouseboi)
	camera_set_view_speed(view_camera[0],cspeed,cspeed)
	camera_set_view_border(view_camera[0],128,128)
}
buttoncselected=0
global.winddir=0