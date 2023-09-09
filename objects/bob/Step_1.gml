/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(aud)&&talked)
{
	vspeed-=1
	image_angle+=vspeed
}
if(distance_to_object(player)<120)
{
	if(!audio_is_playing(aud)&&!talked)
	{
		audio_play_sound(aud,1000,false)
	}
	talked=true
	player.talking=true
	sprite_index=talkycat
}