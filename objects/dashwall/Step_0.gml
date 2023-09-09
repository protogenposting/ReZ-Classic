/// @description Insert description here
// You can write your code in this editor
if(instance_exists(player)&&distance_to_object(player)<=1366/2)
{
	depth=player.depth+1
	if(player.dashedtimes==0)
	{
		audio_stop_sound(blockbreak)
		inst=instance_create_depth(x,y,depth-1,wall)
		inst.alarm[0]=1
		inst.coly=c_green
		if(place_meeting(x,y,player))
		{
			inst=instance_create_depth(player.x,player.y,depth,spike)
			inst.alarm[0]=2
		}
	}

	if(dashed&&player.iy[2]>4)
	{
		if(!audio_is_playing(blockbreak))
		{
			audio_play_sound(blockbreak,1000,false)
		}
		part_particles_create(breakdashwall,x,y,breakdashwall,30)
	}
	dashed=!player.dashedtimes==0
}