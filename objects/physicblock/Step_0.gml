/// @description Insert description here
// You can write your code in this editor
if(!paused&&instance_exists(player))
{
if(place_meeting(x,y+sign(player.grav),player))
{
	inst=instance_create_depth(player.x,player.y,depth,spike)
	inst.alarm[0]=2
}
else if(place_meeting(x,y+vsp,player))
{
	if(player.vsp>sign(player.grav))
	{
		player.vsp=vsp*1.5
	}
	else
	{
		player.vsp=vsp
	}
}
col=instance_place(x-3,y,player)
if(col)
{
	hsp+=8
}
col=instance_place(x+3,y,player)
if(col)
{
	hsp-=8
}
vsp+=player.grav
hsp*=0.9
image_yscale=sign(player.grav)
//hcol
if(place_meeting(x+hsp,y,wall))
{
    while(!place_meeting(x+sign(hsp),y,wall))
    {
        x += sign(hsp)
    }
    hsp=0
}
x+=hsp

//vcol
if(place_meeting(x,y+vsp,wall))
{
    while(!place_meeting(x,y+sign(vsp),wall))
    {
        y += sign(vsp)
    }
    if(vsp>=20)
    {
    //put stuff for long falls here
    }
    vsp = 0
}
y+=vsp
}