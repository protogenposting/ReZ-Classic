/// @description weewee
// You can write your code in this editor
audio_emitter_position(emitter, x, y, 0);
if(alarm[0]>0&&image_index>=24&&!audio_is_playing(aud)&&distance_to_object(player)<1000)
{
	aud=audio_play_sound_on(emitter,bouncecrank,false,1)
}
else
{
	audio_stop_sound(aud)
}
if(distance_to_object(player)>1000)
{
	audio_stop_sound(aud)
	audio_stop_sound(aud2)
}
if(!instance_exists(player))
{
	mask_index=Sprite2
}
else
{
	mask_index=spring
}