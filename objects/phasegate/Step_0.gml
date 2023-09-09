/// @description Insert description here
// You can write your code in this editor
if(!place_meeting(x,y,player))
{
	can=true
}
if(place_meeting(x,y,player)&&can)
{
	can=false
	player.phasing=true
	player.alarm[1]=60
}