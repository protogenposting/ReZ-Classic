/// @description Insert description here
// You can write your code in this editor
audio_stop_all()
if(room==cutscene1)
{
	vid="intro.mp4"
}
if(room==cutscene2)
{
	vid="transition.mp4"
}
if(room==gameopen)
{
	vid="gameintro.mp4"
}
my_video = video_open(vid);
alarm[0]=(video_get_duration()/1000)*60