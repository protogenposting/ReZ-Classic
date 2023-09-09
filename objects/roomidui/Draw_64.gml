//@description room name
if(!instance_exists(cutscener))
{
var b_side=false
var num=0
var num2=0
var chapterid=0
var levelid=0
repeat(array_length(player.chapter))
{
	num2=0
	repeat(array_length(player.chapter[num]))
	{
		show_debug_message(num)
		show_debug_message(num2)
		if(room==player.chapter[num][num2])
		{
			chapterid=num
			levelid=num2
			break;
		}
		num2+=1
	}
	num+=1
}
var num=0
var num2=0
repeat(array_length(player.chapterb))
{
	num2=0
	repeat(array_length(player.chapterb[num]))
	{
		if(room==player.chapterb[num][num2])
		{
			chapterid=num
			levelid=num2
			b_side=true
			break;
		}
		num2+=1
	}
	num+=1
}
draw_set_font(Font2);
var text=string(chapterid)+"A-"+string(levelid)
if(b_side)
{
	text=string(chapterid)+"B-"+string(levelid)
}
draw_text(10,64,text);
draw_sprite(collected,starcoinscollected[room],32,128)
draw_text(10,104+64,"StarCoins: " + string(starcoins));
if(menuthingy.speedrun)
{
	draw_text(10,104+128,"time: " + string(menuthingy.h)+ " : " +string(menuthingy.m)+ " : " +string(menuthingy.s)+ " : " +string(menuthingy.i));
}
if(keyboard_check_pressed(vk_tab))
{
	debug=!debug
}
if(debug)
{
	draw_text(10,104+128+64,"x: "+string(player.x)+" y: "+string(player.y));
	var _list = ds_list_create();
	var _num=collision_point_list(player.x,player.y,all,true,true,_list,true)
	var str=""
	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	       str=string_insert(object_get_name(_list[| i].object_index)+", ",str,string_length(str))
	    }
	}
	ds_list_destroy(_list);
	draw_text(10,104+256,"collisions: "+str);
	draw_text(10,104+256+64,"hspeed: "+string(player.hsp)+" vspeed: "+string(player.vsp));
	draw_text(10,104+256+128,"player values: "+ string(player.iy));
	draw_text(10,104+256+128+64,"distance to exit: "+ string(point_distance(player.x,player.y,NextRoom.x,NextRoom.y)));
	if(instance_exists(starcoin))
	{
		draw_text(10,104+512,"distance to starcoin: "+ string(point_distance(player.x,player.y,starcoin.x,starcoin.y)));
	}
}
}