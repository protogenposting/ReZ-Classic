/// @description Insert description here
// You can write your code in this editor
if(!paused)
{
if(collision_line(x,y,x,y-256,player,true,true))
{
	vsp=-10
}
vsp+=grav
if(!place_meeting(x+hsp,y+1,wall))
{
	hsp*=-1
}
if(place_meeting(x+hsp,y,wall))
{
    while(!place_meeting(x+sign(hsp),y,wall))
    {
        x += sign(hsp)
    }
    hsp*=-1
}
x+=hsp
if(abs(hsp)>1)
{
	hsp*=0.9
}
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

image_xscale=hsp
}