/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(player)<500)
{
	inst=instance_create_depth(x,y,0,bubble)
	inst.homing=true
}
alarm[0]=120