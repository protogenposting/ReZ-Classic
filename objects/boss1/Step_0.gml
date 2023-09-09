/// @description Insert description here
// You can write your code in this editor
if(!paused)
{
if(collision_line(x,y,x,y-256,player,true,true)&&vsp==0)
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

image_xscale=sign(hsp+1)*5
image_yscale=((5+(vsp*0.1))*(hp/mhp))+1
}

if(collision_rectangle(x-16*image_xscale,y-(16*image_yscale)-16,x+16*image_xscale,y-(16*image_yscale),player,true,true))
{
	hp-=1
	player.y-=1
	player.hsp+=(sign(x-player.x)*player.movespd)*3
	player.iy[2]=30
	player.vsp=-15
	inst=instance_create_depth(x,y,depth,enemy)
	inst.hsp=random_range(-10,10)
	instance_destroy(enemyspawn)
}

if(hp<=0)
{
	instance_destroy()
}