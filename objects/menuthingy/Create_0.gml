/// @description Insert description here
// You can write your code in this editor
hitbox=false
editormode=false
audio_play_sound(menutheme,1000,true)
inputs=[]
player_cords=[]

load_level=function(){
	show_debug_message("loading save...")
	if(file_exists("savedshit.txt"))
	{
		var _buffer = buffer_load("savedshit.txt")
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		show_debug_message("game LOADED DIAPER! "+string(_loadData))
		room_goto(_loadData.level)
		instance_create_depth(x,y,depth,roomidui)
		roomidui.starcoinscollected=_loadData.starsgotten
		roomidui.starcoins=_loadData.stars
		if(variable_struct_exists(_loadData,"moons"))
		{
			menuthingy.moons=_loadData.moons
		}
		if(variable_struct_exists(_loadData,"roomsbeaten"))
		{
			roomidui.roomsbeaten=_loadData.roomsbeaten
		}
		if(variable_struct_exists(_loadData,"skin"))
		{
			menuthingy.idle=_loadData.skin[0]
			menuthingy.spin=_loadData.skin[1]
		}
	}
	else
	{
		show_message("no save found lol")
	}
}
load_inputs=function(){
	show_debug_message("loading save...")
	if(file_exists("tas.txt"))
	{
		var _buffer = buffer_load("tas.txt")
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		show_debug_message("game LOADED DIAPER! "+string(_loadData))
		return _loadData.inputs;
	}
	else
	{
		show_message("no tas found")
		return array_create(0);
	}
}
alarm[0]=30
al=0
pressed=false
volumey=0.5
ballsmode=true
speedrun=false
i=0
s=0
m=0
h=0
depth=-1000
	
	selectingblocks=false
	
	obj[0]={
		object: player,
	}
	obj[1]={
		object: wall,
	}
	obj[2]={
		object: spike,
	}
	obj[3]={
		object: spikebutcool,
	}
	obj[4]={
		object: enemy,
	}
	obj[5]={
		object: physicblock,
	}
	obj[6]={
		object: antiphysicblock,
	}
	obj[7]={
		object: jumpring,
	}
	obj[8]={
		object: Checkpoint,
	}
	obj[9]={
		object: textboicustom,
	}
	obj[10]={
		object: unverifiedmoon,
	}
	obj[11]={
		object: buzzyboi,
	}
	obj[12]={
		object: buzzyboiweak,
	}
	obj[13]={
		object: doritowo,
	}
	obj[14]={
		object: playerantispingate,
	}
	obj[15]={
		object: phasegate,
	}
	obj[16]={
		object: playerlaunchgate,
	}
	obj[17]={
		object: springy,
	}
	obj[18]={
		object: warper,
	}
	obj[19]={
		object: warper2,
	}
	obj[20]={
		object: laserblock,
	}
	obj[21]={
		object: mirrorwall,
	}
	obj[22]={
		object: coongunner,
	}
	obj[23]={
		object: coonbubbler,
	}
	obj[24]={
		object: chaseblock,
	}
	obj[25]={
		object: moonblock,
	}
	obj[26]={
		object: bubble,
	}
	obj[27]={
		object: vinespinner,
	}
	obj[28]={
		object: NextRoom,
	}
	obj[29]={
		object: scriptedobject,
	}
	array_insert(obj,4,{
		object: spikebutcool,
	})
	array_insert(obj,20,{
		object: buttony,
	})
	array_insert(obj,2,{
		object: semisolid,
	})
	array_insert(obj,16,{
		object: playerremovegate,
	})
	array_insert(obj,16,{
		object: dashwall,
	})
	save_settings=function(){
	//make epoc array
	var _saveData = {
		volume: menuthingy.volumey,
		lights: menuthingy.ballsmode,
		cspeed:5,
		gopacity:0.5,
		hfuse: menuthingy.hfuse,
		holdtospin: menuthingy.holdtospin,
		screenflips: menuthingy.screenflips,
	}
	
	var _string = json_stringify(_saveData)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,"settings.txt")
	buffer_delete(_buffer)
	
	show_debug_message("settings saved! "+_string)
	}
	
	save_tas=function(){
	//make epoc array
	var _saveData = {
		inputs: menuthingy.inputs
	}
	
	var _string = json_stringify(_saveData)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,"tas.txt")
	buffer_delete(_buffer)
	
	show_debug_message("tas saved! "+_string)
	}
	
	load_settings=function(){
	show_debug_message("loading settings...")
	if(file_exists("settings.txt"))
	{
		var _buffer = buffer_load("settings.txt")
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		show_debug_message("game LOADED DIAPER! "+string(_loadData))
		menuthingy.volumey=_loadData.volume
		menuthingy.ballsmode=_loadData.lights
		menuthingy.cspeed=_loadData.cspeed
		menuthingy.gopacity=_loadData.gopacity
		if(variable_struct_exists(_loadData,"hfuse"))
		{
			menuthingy.hfuse=_loadData.hfuse
		}
		if(variable_struct_exists(_loadData,"holdtospin"))
		{
			menuthingy.holdtospin=_loadData.holdtospin
		}
		if(variable_struct_exists(_loadData,"screenflips"))
		{
			menuthingy.screenflips=_loadData.screenflips
		}
	}
	else
	{
		
	}
	}
	save_level=function(){
	//make epoc array
	var array = array_create(0)
	var num=0
	repeat(instance_number(all))
	{
		inst=instance_find(all,num)
		if(inst.object_index!=menuthingy&&inst.object_index!=spike&&inst.vspeed==0)
		{
		var instsav={
			x: inst.x,
			y: inst.y,
			objtype: inst.object_index,
			objname: object_get_name(inst.object_index),
			rot: image_angle
		}
		if(instsav.objtype==bufferobject)
		{
			instsav.obj=inst.obj
		}
		if(instsav.objtype==textboicustom)
		{
			instsav.texty=inst.texty
		}
		if(instsav.objtype==scriptedobject)
		{
			instsav.commands=inst.commands
		}
		if(instsav.objtype==chaseblock)
		{
			instsav.height=inst.height
			instsav.width=inst.width
			instsav.hsp=inst.hsp
			instsav.vsp=inst.vsp
		}
		array_push(array,instsav)
		show_debug_message(object_get_name(inst.object_index))
		}
		num+=1
	}
	var _saveData = {
		objects: array,
		room_width: room_width,
		room_height: room_height,
		grav:menuthingy.levelgravity,
		verified:"losjngdfnjgosoejgiunsaefihjonijpooingrogfkijnsefoijnsojguind"
	}
	
	var _string = json_stringify(_saveData)
	_string = base64_encode(_string)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	show_debug_message("game saved! "+_string)
	var file;
	file = get_save_filename(".txt", "level");
	if file != ""
	{
	   buffer_save(_buffer,file)
	}
	buffer_delete(_buffer)
	}
	
	
	
	load_editor=function(){
		var file;
		file = get_open_filename("text file|*.txt", "");
		if file != ""
		{
			var num2 = 0
			repeat(array_length(menuthingy.obj))
			{
				instance_destroy(menuthingy.obj[num2].object)
				num2+=1
			}
			instance_destroy(bufferobject)
			var _buffer = buffer_load(file)
			
			var _string = buffer_read(_buffer,buffer_string)
			buffer_delete(_buffer)
			_string = base64_decode(_string)
			var _loadData = json_parse(_string)
			show_debug_message("game LOADED DIAPER! "+string(_loadData))
			var num=0
			room_width= _loadData.room_width
			room_height= _loadData.room_height
			repeat(array_length(_loadData.objects))
			{
				inst=instance_create_depth(_loadData.objects[num].x,_loadData.objects[num].y,0,_loadData.objects[num].objtype)
				if(variable_struct_exists(_loadData.objects[num],"rot"))
				{
					inst.image_angle=_loadData.objects[num].rot
				}
				if(variable_struct_exists(_loadData.objects[num],"obj"))
				{
					inst.obj=_loadData.objects[num].obj
				}
				if(variable_struct_exists(_loadData.objects[num],"texty"))
				{
					inst.texty=_loadData.objects[num].texty
				}
				if(variable_struct_exists(_loadData.objects[num],"commands"))
				{
					inst.commands=_loadData.objects[num].commands
				}
				if(variable_struct_exists(_loadData.objects[num],"hsp"))
				{
					inst.hsp=_loadData.objects[num].hsp
					inst.vsp=_loadData.objects[num].vsp
					inst.width=_loadData.objects[num].width
					inst.height=_loadData.objects[num].height
				}
				num+=1
			}
			if(variable_struct_exists(_loadData,"grav"))
			{
				menuthingy.levelgravity=_loadData.grav
			}
		}
		else
		{
			show_message("no level found lol")
		}
		}
	erasing=false
	uihidden=false
	cspeed=5
	gopacity=0.2
	load_settings()
	levelgravity=true
	moons=0
	buttoncselected=0
	tasmode=false
	hfuse=false
	holdtospin=false
	paused=false
	screenflips=false
	tasplaymode=false
	
	truei=0
	
	function customsprites()
	{
		var num=get_integer("idle strip length",1)
		idle=sprite_add(get_open_filename("image strips","idle"),num,false,false,0,0)
		sprite_set_offset(idle,sprite_get_width(idle)/2,sprite_get_height(idle)/2)
		var num=get_integer("b-side idle strip length",1)
		bidle=sprite_add(get_open_filename("*image strips","bsideidle"),num,false,false,0,0)
		sprite_set_offset(bidle,sprite_get_width(bidle)/2,sprite_get_height(bidle)/2)
		var num=get_integer("spin strip length",1)
		spin=sprite_add(get_open_filename("image strips","spin"),num,false,false,0,0)
		sprite_set_offset(spin,sprite_get_width(spin)/2,sprite_get_height(spin)/2)
	}
	
	idle=Sprite1
	bidle=bsidespin
	spin=playerspin
	