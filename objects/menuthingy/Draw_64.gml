/// @description Insert description here
// You can write your code in this editor 
var button = array_create(0)
if(room==menu)
{
button[0]={
	name:"New Game",
	func: function(){
		menuthingy.alarm[1]=120
		menuthingy.alarmfunc=function(){
			file_delete("savedshit.txt")
			room_goto(cutscene1)
		}
	}
}
if(file_exists("savedshit.txt"))
{
	button[0]={
		name:"Load Game",
		func: function(){
			menuthingy.alarm[1]=120
			menuthingy.alarmfunc=function(){
				menuthingy.load_level()
			}
		}
	}
}
button[1]={
	name:"Options",
	func: function(){
		menuthingy.alarm[1]=120
		menuthingy.alarmfunc=function(){
			room_goto(settings)
		}
	}
}
button[2]={
	name:"Editor",
	func: function(){
		menuthingy.alarm[1]=120
		menuthingy.alarmfunc=function(){
			room_goto(editor)
		}
	}
}
button[3]={
	name:"Quit",
	func: function(){
		menuthingy.alarm[1]=120
		menuthingy.alarmfunc=function(){
			game_end()
		}
	}
}
}
else if(room==editor)
{
	button[0]={
		name:"hide ui",
		func: function(){
			menuthingy.uihidden=!menuthingy.uihidden
		}
	}
	if(!menuthingy.uihidden)
	{
	button[1]={
		name:"back",
		func: function(){
			if(!instance_exists(player))
			{
				menuthingy.alarm[1]=120
				menuthingy.alarmfunc=function(){
				room_goto(menu)
			}
			}
		}
	}
	button[2]={
		name:"level settings",
		func: function(){
			var room_widthy=get_integer("room width (default: 1366)",room_width)
			if(room_widthy!="")
			{
				room_width=room_widthy
			}
			var room_heighty=get_integer("room height (default: 768)",room_height)
			if(room_heighty!="")
			{
				room_height=room_heighty
			}
		}
	}
	button[3]={
		name:"select",
		func: function(){
			menuthingy.selectingblocks=!menuthingy.selectingblocks
			menuthingy.erasing=false
		}
	}
	button[4]={
		name:"play (f5/start)",
		func: function(){
			if(findplayer())
			{
			menuthingy.player_cords=[]
			instance_destroy(player)
			instance_destroy(enemy)
			instance_destroy(physicblock)
			var num=0
			repeat(instance_number(bufferobject))
			{
				menuthingy.erasing=false
				inst=instance_find(bufferobject,num)
				instance_create_depth(inst.x,inst.y,menuthingy.depth,inst.obj)
				inst.image_alpha=0
				num+=1
			}
			with(scriptedobject)
			{
				inst=instance_create_depth(x,y,depth,scriptobjectplay)
				inst.commands=commands
				inst.command=command
			}
			instance_destroy(objLightController)
			camera_set_view_target(view_camera[0],player)
			camera_set_view_speed(view_camera[0],-1,-1)
			camera_set_view_border(view_camera[0],99999,99999)
			if(menuthingy.ballsmode)
			{
				instance_create_depth(0,0,0,objLightController)
			}
			}
			else
			{
				show_message("please place a player i am literally begging you")
			}
		}
	}
	button[5]={
		name:"stop (f6/select)",
		func: function(){
			camera_set_view_speed(view_camera[0],menuthingy.cspeed,menuthingy.cspeed)
			camera_set_view_target(view_camera[0],mouseboi)
			camera_set_view_border(view_camera[0],128,128)
			instance_destroy(player)
			instance_destroy(enemy)
			instance_destroy(physicblock)
			instance_destroy(Checkpoint)
			instance_destroy(scriptobjectplay)
			instance_destroy(bubble)
			instance_destroy(playerantispingate)
			with(spike)
			{
				if(falling)
				{
					instance_destroy()
				}
			}
			var num=0
			repeat(instance_number(bufferobject))
			{
				inst=instance_find(bufferobject,num)
				inst.image_alpha=1
				num+=1
			}
			instance_destroy(objLightController)
		}
	}
	
	button[6]={
		name:"erase",
		func: function(){
			instance_destroy(placer)
			menuthingy.erasing=!menuthingy.erasing
		}
	}
	button[7]={
		name:"save",
		func: function(){
			if(!instance_exists(player))
			{
				menuthingy.save_level()
			}
		}
	}
	button[8]={
		name:"load",
		func: function(){
			menuthingy.load_editor()
		}
	}
	button[9]={
		name:"new",
		func: function(){
			var num2 = 0
			repeat(array_length(menuthingy.obj))
			{
				instance_destroy(menuthingy.obj[num2].object)
				num2+=1
			}
			instance_destroy(bufferobject)
		}
	}
	}
}
else if(room==settings)
{
	button[0]={
		name:"menu",
		func: function(){
			menuthingy.alarm[1]=120
			menuthingy.alarmfunc=function(){
				room_goto(menu)
				menuthingy.save_settings()
			}
		}
	}
	button[1]={
		name:"advanced lighting: "+booltoonoff(menuthingy.ballsmode),
		desc:"makes the player and some other objects emit light. disabling can improve performance on larger levels",
		func: function(){
			menuthingy.ballsmode=!menuthingy.ballsmode
		}
	}
	button[2]={
		name:"speedrun mode: "+booltoonoff(menuthingy.speedrun),
		desc:"makes a speedrun timer part of your ui. may be inaccurate",
		func: function(){
			menuthingy.speedrun=!menuthingy.speedrun
		}
	}
	button[3]={
		name:"horizontal fuse: "+booltoonoff(menuthingy.hfuse),
		desc:"fuses blocks together, may make levels impossible",
		func: function(){
			menuthingy.hfuse=!menuthingy.hfuse
		}
	}
	button[3]={
		name:"tas mode: "+booltoonoff(menuthingy.tasmode),
		desc:"slows the game down by 12x and allows save states and input recording",
		func: function(){
			menuthingy.tasmode=!menuthingy.tasmode
		}
	}
	button[6]={
		name:"tas load mode: "+booltoonoff(menuthingy.tasplaymode),
		desc:"replays the player's tas input that was recorded",
		func: function(){
			menuthingy.tasplaymode=!menuthingy.tasplaymode
			menuthingy.tasmode=false
		}
	}
	button[4]={
		name:"hold to climb: "+booltoonoff(menuthingy.holdtospin),
		desc:"hold ctrl/back trigger/f to climb so you dont acidentally climb",
		func: function(){
			menuthingy.holdtospin=!menuthingy.holdtospin
		}
	}
	button[5]={
		name:"gravity screen flip: "+booltoonoff(menuthingy.screenflips),
		desc:"if enabled, the screen will flip upside down when the player does",
		func: function(){
			menuthingy.screenflips=!menuthingy.screenflips
		}
	}
	button[6]={
		name:"activate custom sprites",
		desc:"changes the player's sprites to custom ones",
		func: function(){
			menuthingy.customsprites()
		}
	}
	button[7]={
	name:"delete save",
	desc:"deletes your save",
	func: function(){
		file_delete("savedshit.txt")
	}
}
}
if gamepad_get_axis_deadzone(0) != 0.5
{
    gamepad_set_axis_deadzone(0, 0.5);
}
lkey=keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))||gamepad_button_check_pressed(0,gp_padl)||gamepad_axis_value(0, gp_axislh)<0
rkey=keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))||gamepad_button_check_pressed(0,gp_padr)||gamepad_axis_value(0, gp_axislh)>0
selectkey=keyboard_check_pressed(ord("Z"))||keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
pkey=keyboard_check_pressed(vk_escape)||gamepad_button_check_pressed(0,gp_start)
if(pressed&&alarm[1]>0)
{
	al+=0.01
}
if(room==settings||room==menu)
{
draw_text(0,0,"verified moons: "+string(moons))
var ecs=256
var why=256
var num=0
if(room!=settings)
{
draw_sprite_ext(logo,0,room_width/2,128,3,3,0,c_white,1)
}
repeat(array_length(button))
{
	var size = 0
	var offsetx=random_range(-2,2)
	var offsety=random_range(-2,2)
	if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs-128+offsetx,why-64+offsety,ecs+128+offsetx,why+64+offsety)||buttoncselected==num&&gamepad_is_connected(0))
	{
		if(variable_struct_exists(button[num],"desc"))
		{
			draw_rectangle(room_width/2+128,room_height-256,room_width,room_height,true)
			draw_text_ext(room_width/2+128,room_height-256,button[num].desc,16,512)
		}
		size+=10
		if(mouse_check_button_pressed(mb_left)&&!pressed||selectkey&&!pressed)
		{
			audio_play_sound(selectmenu,1000,false)
			button[num].func()
			if(alarm[1]>0)
			{
				pressed=true
			}
		}
	}
	draw_set_color(c_white)
	draw_rectangle(ecs-128+offsetx-size,why-64+offsety-size,ecs+128+offsetx+size,why+64+offsety+size,true)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(ecs,why,button[num].name)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	num+=1
	ecs+=256
	if(ecs>1024)
	{
		why+=128
		ecs=256
	}
}
}
else
{
	if(pkey)
{
	paused=!paused
}	
}
if(room==settings)
{
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(ecs,why,"volumey")
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_line(ecs-50,why,ecs+50,why)
draw_rectangle(ecs+(volumey*100)-16-50,why-16,ecs+(volumey*100)+16-50,why+16,true)
if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),ecs-50,why,ecs+50,why+64)&&mouse_check_button(mb_left))
{
	volumey=(device_mouse_x_to_gui(0)-ecs+50)/100
}
why+=64
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(ecs,why,"editor camera speed: "+string(cspeed))
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_line(ecs-50,why,ecs+50,why)
draw_rectangle(ecs+(cspeed*5)-16-50,why-16,ecs+(cspeed*5)+16-50,why+16,true)
if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),ecs-50,why,ecs+50,why+64)&&mouse_check_button(mb_left))
{
	cspeed=(device_mouse_x_to_gui(0)-ecs+50)/5
}
why+=64
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(ecs,why,"grid opacity: "+string(gopacity))
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_line(ecs-50,why,ecs+50,why)
draw_rectangle(ecs+(gopacity*100)-16-50,why-16,ecs+(gopacity*100)+16-50,why+16,true)
if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),ecs-50,why,ecs+50,why+64)&&mouse_check_button(mb_left))
{
	gopacity=(device_mouse_x_to_gui(0)-ecs+50)/100
}
}

if(room==editor)
{
	if(keyboard_check(ord("A")))
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-cspeed*2,camera_get_view_y(view_camera[0]))
	}
	if(keyboard_check(ord("D")))
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+cspeed*2,camera_get_view_y(view_camera[0]))
	}
	if(keyboard_check(ord("S")))
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+cspeed*2)
	}
	if(keyboard_check(ord("W")))
	{
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-cspeed*2)
	}
	if(keyboard_check_pressed(vk_f5)||gamepad_button_check_pressed(0,gp_start))
	{
		button[4].func()
		if(alarm[1]>0)
		{
			pressed=true
		}
	}
	if(keyboard_check_pressed(vk_f6)||gamepad_button_check_pressed(0,gp_select))
	{
		button[5].func()
		if(alarm[1]>0)
		{
			pressed=true
		}
	}
	var ecs=0
	var why=0
	var num=0
	repeat(array_length(button))
	{
		var size = 0
		var offsetx=0
		var offsety=0
		
		if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs-size,why-size,ecs+256+size,why+64+size))
		{
			size+=10
			if(mouse_check_button_pressed(mb_left)&&!pressed)
			{
				if(num!=0)
				{
					instance_destroy(placer)
				}
				else if(instance_exists(placer))
				{
					placer.i=1
				}
				audio_play_sound(selectmenu,1000,false)
				button[num].func()
				if(alarm[1]>0)
				{
					pressed=true
				}
			}
		}
		if(selectingblocks&&num==3&&!instance_exists(player))
		{
			var ecs2=ecs+256
			var whyy=why
			var num2 = 0
			
			repeat(array_length(obj))
			{
				draw_rectangle(ecs2,whyy,ecs2+64,whyy+64,true)
				draw_sprite(object_get_sprite(obj[num2].object),0,ecs2+32,whyy+32)
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs2,whyy,ecs2+64,whyy+64)&&mouse_check_button_pressed(mb_left))
				{
					erasing=false
					instance_destroy(placer)
					inst=instance_create_depth(0,0,depth,placer)
					inst.obj=obj[num2].object
				}
				num2+=1
				ecs2+=64
				if(ecs2>256*2)
				{
					ecs2=ecs+256
					whyy+=64
				}
			}
		}
		draw_set_color(c_gray)
		draw_rectangle(ecs-size,why-size,ecs+256+size,why+64+size,true)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(ecs+128,why+32,button[num].name)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		num+=1
		why+=64
	}
	draw_set_color(c_white)
}

if(paused)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(view_get_xport(0)+view_get_wport(0)/2,view_get_yport(0)+view_get_hport(0)/2,"paused")
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	button[0]={
	name:"Restart from checkpoint",
	func: function(){
			with(player)
			{
				instance_destroy();
				audio_play_sound(death,1000,false)
				instance_create_layer(spawnx, spawny, "Instances", object_index);

				instance_create_depth(x,y,depth,effect)
			}
	}
	}
	button[1]={
	name:"Save and menu",
		func: function(){
			with(player)
			{
				save_level()
			}
			menuthingy.alarm[1]=120
			menuthingy.alarmfunc=function(){
				room_goto(menu)
			}
		}
	}
	button[2]={
	name:"Save and settings",
		func: function(){
			with(player)
			{
				save_level()
			}
			menuthingy.alarm[1]=120
			menuthingy.alarmfunc=function(){
				room_goto(settings)
			}
		}
	}
	button[3]={
	name:"Return To Hub",
		func: function(){
			menuthingy.alarm[1]=120
			menuthingy.alarmfunc=function(){
				room_goto(hub)
			}
		}
	}
	var ecs=256
	var why=256
	var num=0
	repeat(array_length(button))
	{
		var size = 0
		var offsetx=random_range(-2,2)
		var offsety=random_range(-2,2)
		if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs-128+offsetx,why-64+offsety,ecs+128+offsetx,why+64+offsety)||buttoncselected==num&&gamepad_is_connected(0))
		{
			size+=10
			if(mouse_check_button_pressed(mb_left)&&!pressed||selectkey&&!pressed)
			{
				audio_play_sound(selectmenu,1000,false)
				button[num].func()
				if(alarm[1]>0)
				{
					pressed=true
				}
			}
		}
		draw_set_color(c_white)
		draw_rectangle(ecs-128+offsetx-size,why-64+offsety-size,ecs+128+offsetx+size,why+64+offsety+size,true)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(ecs,why,button[num].name)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		num+=1
		ecs+=256
		if(ecs>1024)
		{
			why+=128
			ecs=256
		}
	}
}


audio_master_gain(volumey);
draw_set_color(c_black)
draw_set_alpha(al)
draw_rectangle(0,0,room_width,room_height,false)
draw_set_alpha(1)
draw_set_color(c_white)

if(lkey)
{
	buttoncselected-=1
	if(buttoncselected<0)
	{
		buttoncselected=array_length(button)
	}
}
if(rkey)
{
	buttoncselected+=1
	if(buttoncselected>=array_length(button))
	{
		buttoncselected=0
	}
}