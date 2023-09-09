/// @description Insert description here
// You can write your code in this editor
commands=array_create(0)
save_script=function(){
	//make epoc array
	var array = array_create(0)
	var num=0
	repeat(array_length(commands))
	{
		var sav={
			x: inst.x,
			y: inst.y,
			objtype: inst.object_index,
			objname: object_get_name(inst.object_index)
		}
		array_push(array,sav)
		show_debug_message(object_get_name(inst.object_index))
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
sprite=Sprite2
col=c_white

showing=false

command[0]={
	name: "sprite",
	syntax:"(sprite id)",
	args:1,
	func: function(object,spritey,huh,a){
		object.sprite_index=spritey
	}
}
command[1]={
	name: "move",
	syntax:"(x,y)",
	args:2,
	func: function(object,ecs,why,a){
		object.x+=ecs
		object.y+=why
	}
}
command[2]={
	name: "trigger",
	syntax:"number (see docs for all triggers)",
	args:1,
	func: function(object,trigger,huh,a){
		if(trigger==0)
		{
			with(object)
			{
				if(place_meeting(x,y-player.vsp,player))
				{
					with(other)
					{
						return true;
					}
				}
				else
				{
					with(other)
					{
						return false;
					}
				}
			}
		}
		if(trigger==1)
		{
			with(object)
			{
				if(place_meeting(x,y-1,physicblock))
				{
					with(other)
					{
						return true;
					}
				}
				else
				{
					with(other)
					{
						return false;
					}
				}
			}
		}
	}
}

commselected=0
obj=0
