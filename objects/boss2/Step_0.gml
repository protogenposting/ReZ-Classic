/// @description Insert description here
// You can write your code in this editor
if(!paused)
{
hsp=dir*4
if(x>room_width)
{
	dir=-1
}
else if(x<0)
{
	dir=1
}
x+=hsp

y+=vsp

image_xscale=sign(hsp)*5
}

if(collision_rectangle(x-64,y-64,x+64,y-54,player,true,true))
{
	hp-=1
	player.y-=1
	player.hsp+=sign(x-player.x)*20
	player.iy[2]=30
	player.vsp=player.jsp*2
	i[1]=120
	i[0]=120
}

if(hp<=0)
{
	instance_destroy()
}