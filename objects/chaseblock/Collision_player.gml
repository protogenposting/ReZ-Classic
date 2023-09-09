/// @description Insert description here
// You can write your code in this editor
if(!activated)
{
	var ecs=x-((width*64)/2)
	var why=y-((height*64)/2)
	repeat(width)
	{
		repeat(height)
		{
			inst=instance_create_depth(ecs,why,depth,spike)
			inst.hspeed=hsp
			inst.vspeed=vsp
			why+=64
		}
		ecs+=64
		why=y
	}
	player.x+=sign(hsp)*64
	player.y+=sign(vsp)*64
	activated=true
}