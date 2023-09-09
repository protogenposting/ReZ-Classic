//taught by carson!
camera_set_view_pos(view_camera[0],(x-(1366/2)),(y-(768/2)))
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
onground=false
with(starcoin)
{
	following=false
}
instance_destroy(moosicy)
instance_create_depth(x,y,0,moosicy)
hsp=0
vsp=0
jsp=14
movespd=8
fric=0.8
grav=0.7
spawnx=x
spawny=y
hasclock=0.01
rottyo=0
bonked=false
spinmult=0
image_index_real=0

image_xscaley=1
image_xscaleyy=1
image_yscaley=1

alarm[0]=12

spin=true

i=0

iy[0]=0

iy[1]=0

candash=true

camera_set_view_speed(view_camera[0], movespd*3, movespd*3);
camera_set_view_border(view_camera[0], 9999, 9999);

save_level=function(){
	//make epoc array
	var _saveData = {
		stars: roomidui.starcoins,
		level: room,
		starsgotten: roomidui.starcoinscollected,
		moons: menuthingy.moons,
		roomsbeaten: roomidui.roomsbeaten,
		skin:[menuthingy.idle,menuthingy.spin]
	}
	
	var _string = json_stringify(_saveData)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,"savedshit.txt")
	buffer_delete(_buffer)
	
	show_debug_message("game saved! "+_string)
}

if(instance_exists(enemyspawn))
{
	instance_destroy(enemy)
	var num=0
	repeat(instance_number(enemyspawn))
	{
		inst=instance_find(enemyspawn,num)
		with(inst)
		{
			instance_create_depth(x,y,depth,typey)
		}
		num+=1
	}
}
if(instance_exists(bufferobject))
{
	instance_destroy(enemy)
	var num=0
	repeat(instance_number(bufferobject))
	{
		inst=instance_find(bufferobject,num)
		with(inst)
		{
			if(obj==playerantispingate||obj==enemy||object_get_parent(obj)==enemy)
			{
				instance_create_depth(x,y,depth,obj)
			}
		}
		num+=1
	}
}
num=0
repeat(instance_number(physicblock))
	{
		inst=instance_find(physicblock,num)
		with(inst)
		{
			if(variable_instance_exists(id,"ogx"))
			{
				x=ogx
				y=ogy
				hsp=0
				vsp=0
			}
		}
		num+=1
	}
	num=0
	repeat(instance_number(slidewall))
	{
		inst=instance_find(slidewall,num)
		with(inst)
		{
			if(variable_instance_exists(id,"ogx"))
			{
				x=ogx
				y=ogy
				hsp=0
				vsp=0
			}
		}
		num+=1
	}
	num=0
	repeat(instance_number(fallwall))
	{
		inst=instance_find(fallwall,num)
		with(inst)
		{
			if(variable_instance_exists(id,"ogx"))
			{
				x=ogx
				y=ogy
				hsp=0
				vsp=0
			}
		}
		num+=1
	}
	with(scriptobjectplay)
	{
		if(variable_instance_exists(id,"ogx"))
			{
				x=ogx
				y=ogy
			}
	}
	with(boss1)
	{
		if(variable_instance_exists(id,"mhp"))
		{
			hp=mhp
			x=xstart
			y=ystart
			vsp=-0.7
			hsp=-5
		}
		instance_destroy(enemy)
	}
	with(boss2)
	{
		if(variable_instance_exists(id,"mhp"))
		{
			hp=mhp
			x=xstart
			y=ystart
			vsp=-0.7
			hsp=0
		}
		instance_destroy(enemy)
	}
camera_set_view_size(view_camera[0],1366,sign(grav)*768)
iy[2]=0
iy[3]=0
iy[4]=0
dashstop=false
vdash=false
hdash=false

if(menuthingy.tasmode)
{
	game_set_speed(5,gamespeed_fps)
}
paused=false
lstickpressed=false
rstickpressed=false
col=c_white
lkey=keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)||gamepad_axis_value(0, gp_axislh)<0
		rkey=keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)||gamepad_axis_value(0, gp_axislh)>0
		lkey_pressed=keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))||gamepad_button_check_pressed(0,gp_padl)||gamepad_axis_value(0, gp_axislh)<0&&!lstickpressed
		rkey_pressed=keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))||gamepad_button_check_pressed(0,gp_padr)||gamepad_axis_value(0, gp_axislh)>0&&!rstickpressed
		ukey=keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)||gamepad_axis_value(0, gp_axislv)<0
		dkey=keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)||gamepad_axis_value(0, gp_axislv)>0
		jkey=keyboard_check(vk_up)||keyboard_check(vk_space)||gamepad_button_check(0,gp_face1)
		jkey_released=keyboard_check_released(vk_up)||keyboard_check_released(vk_space)||gamepad_button_check_released(0,gp_face1)
		jkey_pressed=keyboard_check_pressed(vk_up)||keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
		gkey=keyboard_check_pressed(ord("X"))||keyboard_check_pressed(ord("E"))||gamepad_button_check_pressed(0,gp_face2)
		dashkey=keyboard_check_pressed(vk_shift)||keyboard_check_pressed(ord("C"))||gamepad_button_check_pressed(0,gp_face3)
		skey=keyboard_check(vk_lcontrol)||keyboard_check(ord("F"))||gamepad_button_check(0,gp_shoulderlb)||gamepad_button_check(0,gp_shoulderrb)
		savestatekey=keyboard_check_pressed(vk_tab)||gamepad_button_check_pressed(0,gp_select)
		loadstatekey=keyboard_check_pressed(vk_ralt)||gamepad_button_check_pressed(0,gp_face4)
savestatekey=0
loadstatekey=0

chapter=moosicy.chapter
chapterb=moosicy.chapterb
dashtimes=1
dashedtimes=0
b_side=false
currentchapter=0
var num=0
var num2=0
repeat(array_length(chapter))
{
	num2=0
	repeat(array_length(chapter[num]))
	{
		show_debug_message(num)
		show_debug_message(num2)
		if(room==chapter[num][num2])
		{
			currentchapter=num
			break;
		}
		num2+=1
	}
	num+=1
}
var num=0
var num2=0
repeat(array_length(chapterb))
{
	num2=0
	repeat(array_length(chapterb[num]))
	{
		if(room==chapterb[num][num2])
		{
			currentchapter=num
			player.dashtimes=2
			b_side=true
			break;
		}
		num2+=1
	}
	num+=1
}

canspin=true

phasing=false

al=1

menuthingy.player_cords=[]

with(spike)
{
	if(hspeed!=0||vspeed!=0)
	{
		instance_destroy()
	}
}

with(bubble)
{
	x=xstart
	y=ystart
	if(variable_instance_exists(id,"homing")&&homing)
	{
		instance_destroy()
	}
}

mooned=false

talking=false
iy[5]=1

with(vinespinner)
{
	rot=180
}

with(dashrestore)
{
	empty=false
	col=c_white
}