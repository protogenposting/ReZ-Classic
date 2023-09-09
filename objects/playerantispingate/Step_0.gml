/// @description Insert description here
// You can write your code in this editor
if(!place_meeting(x,y,player))
{
	can=true
}
if(place_meeting(x,y,player)&&can)
{
	can=false
	player.canspin=!player.canspin
	player.hsp=sign(player.hsp)*20
	player.dashedtimes=2
	part_particles_create(breakantispin,x,y,breakantispin,30)
	instance_destroy()
}