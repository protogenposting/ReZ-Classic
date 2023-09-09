/// @description Insert description here
// You can write your code in this editor
other.hsp=lengthdir_x(player.jsp+8,image_angle-270)
other.vsp=lengthdir_y(player.jsp+8,image_angle-270)
other.x+=lengthdir_x(1,image_angle-270)
other.y+=lengthdir_y(1,image_angle-270)
other.dashedtimes=0
other.candash=true
image_speed=1
image_index=0
alarm[0]=61
if(distance_to_object(player)<1000)
{
	aud2=audio_play_sound_on(emitter,bounce1,false,1)
	aud=audio_play_sound_on(emitter,bouncecrank,false,1)
}