/// @description Insert description here
// You can write your code in this editor
if(player.jkey&&image_alpha>=1)
{
	player.vsp=-player.jsp*sign(player.grav)
	image_alpha=0
	player.dashedtimes=0
	player.candash=true
	if(other.iy[3]<120)
	{
	other.iy[3]=120
	}
	player.spinmult=0
}
