mask_index=playerspin
hsp+=global.winddir
grav=0.7
//spinmult=0
if(mooned)
{
	grav=grav*0.3
}
if(dkey)
{
	mask_index=playersmol
}
if(iy[3]<=0)
{
	spinmult=0
}
if(b_side)
{
	spinmult=0
	dashtimes=2
}
if(!canspin)
{
	spinmult=0
}

if(talking&&instance_exists(npceesnuts))
{
	camera_set_view_size(view_camera[0],(1366/2),(768/2))
	inst=instance_nearest(x,y,npceesnuts)
	camera_set_view_pos(view_camera[0],(inst.x-(1366/4)),(inst.y-(768/4)))
}
else
{
	camera_set_view_speed(view_camera[0],5,5)
	if(distance_to_point(camera_get_view_x(view_camera[0])+(1366/2),camera_get_view_y(view_camera[0])+(768/2))>128)
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+((x-(camera_get_view_x(view_camera[0])+(1366/2)))/20),camera_get_view_y(view_camera[0])+((y-(camera_get_view_y(view_camera[0])+(768/2)))/20))
	}
	while(camera_get_view_x(view_camera[0])<0)
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+1,camera_get_view_y(view_camera[0]))
	}
	while(camera_get_view_y(view_camera[0])<0)
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+1)
	}
	while(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])>room_width)
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-1,camera_get_view_y(view_camera[0]))
	}
	while(camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])>room_height)
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-1)
	}
	camera_set_view_size(view_camera[0],1366,768)
}
if(!paused&&!talking)
{
iy[0]-=1
iy[1]-=1
iy[2]-=1
iy[4]-=1
if gamepad_get_axis_deadzone(0) != 0.5
{
    gamepad_set_axis_deadzone(0, 0.5);
}

if gamepad_get_axis_deadzone(0) != 0.5
{
    gamepad_set_axis_deadzone(0, 0.5);
}
audio_stop_sound(spiny)
jsp=14
sprite_index=menuthingy.idle
if(b_side||!canspin)
{
	sprite_index=menuthingy.bidle
}
while(rottyo>360||rottyo<-360)
{
	rottyo-=360*sign(rottyo)
}
rottyo-=(rottyo)/10
image_yscale=1
image_speed=1
if(spinmult>0)
{
spinmult-=0.1
iy[3]-=1
}
if(spinmult>0)
{
	iy[3]-=1
	image_speed=2
	audio_play_sound(spiny,1000,false)
	audio_sound_pitch(spiny,1+(spinmult/2))
	jsp=23
	grav=0.2
	sprite_index=menuthingy.spin
	if(vsp>0)
	{
		vsp-=1
	}
	if(iy[2]>0)
	{
		iy[2]+=1
	}
	
}
if(mask_index==playersmol)
{
	image_yscale*=0.75
}
if(lkey)
{
if(hsp>-movespd)
{
hsp-=movespd/6
image_xscaley=-1
}
}
if(rkey)
{
if(hsp<movespd)
{
hsp+=movespd/6
image_xscaley=1

}
}
if(!lkey)
{
	lstickpressed=false
}
if(!rkey)
{
	rstickpressed=false
}

if(spinmult>0&&vsp==0)
{
hsp*=fric
}

if(!lkey&&!rkey||abs(hsp)>movespd&&vsp==0)
{
	hsp-=(sign(hsp)*movespd)/3
	if(abs(hsp)<2)
	{
		hsp=0
	}
}

if(iy[2]<=0&&!dashstop)
{
	if(!bonked)
	{
	image_xscaley=sign(image_xscaley)
	image_yscaley=1
	}
	if(!place_meeting(x,y,playerlaunchgate))
	{
		if(vdash&&vsp>0)
		{
			
		}
		else
		{
			if(vdash)
			{
				vsp=jsp*sign(vsp)
			}
			hsp=movespd*sign(hsp)
			
		}
	}
	dashstop=true
	vdash=false
	hdash=false
}



onground=false
if(place_meeting(x,y+sign(grav),wall)&&!phasing||place_meeting(x,y+5,semisolid)&&!phasing&&vsp>=0)
{
alarm[2]=0
onground=true
iy[3]-=(iy[3]-360)/5
if(-(iy[3]-360)>200)
{
	iy[3]=360
}
iy[4]=10
iy[5]=5
col=instance_place(x,y+5,semisolid)
if(col&&!phasing&&vsp>=0&&col.vsp!=0)
{
	iy[4]=15
}
mooned=false
vsp=0
col=c_white
if(spinmult>0)
{
	vsp+=2
}
if(dashedtimes>0&&iy[2]<0)
{
	effect_create_above(ef_cloud,x,bbox_bottom,0.5,c_white)
	candash=true
	dashedtimes=0
}
}
else if(jkey_pressed&&iy[4]<=0&&iy[5]<=0&&iy[1]<=0)
{
	spinmult+=2.5
	iy[1]=21
}
if(iy[2]>0&&onground)
{
	if(jkey&&!vdash)
	{
		onground=false
		hsp=(movespd*3)*sign(hsp)
		vsp=-jsp/10
		if(iy[2]<=5)
		{
			candash=true
			dashedtimes=0
		}
		iy[2]=0
		image_xscaley=sign(image_xscaley)
		dashstop=true
		vdash=false
		hdash=false
	}
}
iy[5]-=1
show_debug_message("HERE>"+string(iy[5]))
if(!jkey&&vsp!=0)
{
	iy[5]=0
}
show_debug_message("HERE>"+string(iy[5])+"HERE>"+string(iy[4]))
if(jkey_released)
{
	iy[4]=0
}
if(jkey&&iy[4]>0&&iy[5]>0)
{
if(spinmult>1.2)
{
	col=c_green
}
if(spinmult<1.2&&spinmult>0)
{
	col=c_red
}
vsp-=(jsp*sign(grav))/5
//audio_play_sound(jump,1000,false)
}
else
{
	vsp += (grav*!vdash)*(!place_meeting(x,y,playerlaunchgate))
}
show_debug_message("HERE>"+string(iy[5]))
//fall
if(vsp < 20||vsp > -20)
{
jumping=true
}
else
{
jumping=true
}

///collisions
if(!phasing)
{
//hcol
if(place_meeting(x+hsp,y,wall)&&!place_meeting(x,y+64,wall))
{
	if(!menuthingy.holdtospin||skey)
	{
		effect_create_above(ef_spark,x,y,0.5,c_white)
		if(jkey_pressed)
		{
			hsp=(movespd*-sign(hsp))*2.3
			vsp=-jsp/1.2
			spinmult=0
		}
		else if (vsp>0)
		{
			vsp=1
		}
	}
}
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
	alarm[2]=0
	vsp = 0
}
if(place_meeting(x,y+vsp,semisolid)&&vsp>0)
{
    while(!place_meeting(x,y+sign(vsp),semisolid))
    {
        y += sign(vsp)
    }
    if(vsp>=20)
    {
    //put stuff for long falls here
    }
	alarm[2]=0
	vsp = 0
}
y+=vsp
col=instance_place(x,y,wall)
}
else
{
	x+=hsp
	y+=vsp
}

i-=1


if(dashkey&&candash)
{
	bonked=false
	vdash=ukey||dkey
	hdash=rkey||lkey
	hsp=((movespd*5)*(rkey-lkey))/1.3
	vsp=(-((jsp*2)*(ukey-dkey)))/1.3
	if(vdash)
	{
		y-=1
		if(vsp>0)
		{
			vsp*=2
			hsp*=2
		}
	}
	iy[2]=7*1.3
	alarm[2]=25
	dashedtimes+=1
	if(dashedtimes>=dashtimes)
	{
		candash=false
	}
	dashstop=false
}
var pos
if(spin)
{
	pos=bbox_bottom-10
}
if(!spin)
{
	pos=bbox_top+10
}
if(iy[2]>0)
{
	inst=instance_create_depth(x,pos,depth+1,effect)
	inst.sprite_index=Sprite66
}

if(dashedtimes==0)
{
	inst=instance_create_depth(x,pos,depth+1,effect)
	inst.sprite_index=Sprite67
}
if(dashedtimes==1&&b_side)
{
	inst=instance_create_depth(x,pos,depth+1,effect)
	inst.sprite_index=Sprite67
	inst.image_xscale=0.5
	inst.image_yscale=0.5
}






}
while(sign(grav)==1&&place_meeting(x,y,semisolid)&&vsp>=0||sign(grav)==1&&collision_point(x,bbox_bottom,wall,true,true)&&!phasing||sign(grav)==-1&&collision_point(x,bbox_top,wall,true,true)&&!phasing)
{
	y-=sign(grav)
}
while(sign(grav)==-1&&collision_point(x,bbox_bottom,wall,true,true)&&!phasing||sign(grav)==1&&collision_point(x,bbox_top,wall,true,true)&&!phasing)
{
	y+=sign(grav)
}

if(savestatekey&&menuthingy.tasmode)
{
	game_save("tas save state")
}
if(loadstatekey&&menuthingy.tasmode)
{
	game_load("tas save state")
}

cursor_sprite=cr_none

with(chaseblock)
{
	activated=false
}