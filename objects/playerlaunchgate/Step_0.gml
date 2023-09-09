/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,player))
{
	if(player.hdash)
	{
		player.hsp=sign(player.hsp)*20
	}
	if(player.vdash)
	{
		player.vsp=sign(player.vsp)*20
	}
	if(!player.hdash&&!player.vdash)
	{
		player.vsp=sign(player.vsp)*20
		player.hsp=sign(player.hsp)*20
	}
	player.iy[2]=2
	player.dashedtimes=0
	player.candash=true
}