if(room!=editor)
{
roomidui.roomsbeaten[room]=true
instance_destroy();

var num=0
var num2=0
repeat(array_length(chapter))
{
	num2=0
	repeat(array_length(chapter[num]))
	{
		if(room==chapter[num][array_length(chapter[num])-1])
		{
			room_goto(hub)
			break;
		}
		if(room==chapter[num][num2])
		{
			room_goto(chapter[num][num2+1])
			break;
		}
		num2+=1
	}
	num+=1
}
num=0
num2=0
repeat(array_length(chapterb))
{
	num2=0
	repeat(array_length(chapterb[num]))
	{
		if(room==chapterb[num][array_length(chapterb[num])-1])
		{
			room_goto(hub)
			break;
		}
		if(room==chapterb[num][num2])
		{
			room_goto(chapterb[num][num2+1])
			break;
		}
		num2+=1
	}
	num+=1
}
num=0
num2=0
repeat(array_length(chapterc))
{
	num2=0
	repeat(array_length(chapterc[num]))
	{
		if(room==chapterc[num][array_length(chapterc[num])-1])
		{
			room_goto(hub)
			break;
		}
		if(room==chapterc[num][num2])
		{
			room_goto(chapterc[num][num2+1])
			break;
		}
		num2+=1
	}
	num+=1
}
}
else
{
			camera_set_view_speed(view_camera[0],menuthingy.cspeed,menuthingy.cspeed)
			camera_set_view_target(view_camera[0],mouseboi)
			instance_destroy(player)
			instance_destroy(enemy)
			instance_destroy(physicblock)
			var num=0
			repeat(instance_number(bufferobject))
			{
				inst=instance_find(bufferobject,num)
				inst.image_alpha=1
				num+=1
			}
			instance_destroy(objLightController)
			camera_set_view_border(view_camera[0],128,128)
}