/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(aud)&&talked)
{
	instance_destroy()
}
if(distance_to_object(player)<120)
{
	if(!audio_is_playing(aud)&&!talked)
	{
		audio_play_sound(aud,1000,false)
	}
	talked=true
	player.talking=true
}