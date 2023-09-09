/// @description Insert description here
// You can write your code in this editor
var col=c_white
if(side==0&&roomidui.roomsbeaten[moosicy.chapter[chapter][array_length(moosicy.chapter[chapter])-1]])
{
	col=c_green
}
if(side==1&&roomidui.roomsbeaten[moosicy.chapterb[chapter][array_length(moosicy.chapterb[chapter])-1]])
{
	col=c_green
}
if(side==2&&roomidui.roomsbeaten[moosicy.chapterc[chapter][array_length(moosicy.chapterc[chapter])-1]])
{
	col=c_green
}
if(side==0)
{
	var num=0
	var num2=0
	repeat(array_length(moosicy.chapter[chapter]))
	{
		if(roomidui.starcoinscollected[moosicy.chapter[chapter][num]])
		{
			num2+=1
		}
		num+=1
	}
	if(num2==array_length(moosicy.chapter[chapter]))
	{
		col=c_yellow
		effect_create_above(ef_spark,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),0.5,c_yellow)
	}
}
if(side==1)
{
	var num=0
	var num2=0
	repeat(array_length(moosicy.chapterb[chapter]))
	{
		if(roomidui.starcoinscollected[moosicy.chapterb[chapter][num]])
		{
			num2+=1
		}
		num+=1
	}
	if(num2==array_length(moosicy.chapterb[chapter]))
	{
		col=c_yellow
		effect_create_above(ef_spark,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),0.5,c_yellow)
	}
}
if(side==2)
{
	var num=0
	var num2=0
	repeat(array_length(moosicy.chapterc[chapter]))
	{
		if(roomidui.starcoinscollected[moosicy.chapterc[chapter][num]])
		{
			num2+=1
		}
		num+=1
	}
	if(num2==array_length(moosicy.chapterc[chapter]))
	{
		col=c_yellow
		effect_create_above(ef_spark,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),0.5,c_yellow)
	}
}
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,col,1)

draw_text(x,y-128,"Chapter "+string(chapter))
if(side==0)
{
	draw_text(x,y-96,"A side")
}
if(side==1)
{
	draw_text(x,y-96,"B side")
}
if(side==2)
{
	draw_text(x,y-96,"C side")
}

if(collision_line(x,y,x,y+128,player,true,true))
{
	if(side==0)
	{
		var num=0
		var ecs=(x-((array_length(moosicy.chapter[chapter])*32)/2))+16
		repeat(array_length(moosicy.chapter[chapter]))
		{
			draw_sprite(collected,roomidui.starcoinscollected[moosicy.chapter[chapter][num]],ecs,y-64)
			num+=1
			ecs+=32
		}
	}
	if(side==1)
	{
		var num=0
		var ecs=(x-((array_length(moosicy.chapterb[chapter])*32)/2))+16
		repeat(array_length(moosicy.chapterb[chapter]))
		{
			draw_sprite(collected,roomidui.starcoinscollected[moosicy.chapterb[chapter][num]],ecs,y-64)
			num+=1
			ecs+=32
		}
	}
	if(side==2)
	{
		var num=0
		var ecs=(x-((array_length(moosicy.chapterc[chapter])*32)/2))+16
		repeat(array_length(moosicy.chapterc[chapter]))
		{
			draw_sprite(collected,roomidui.starcoinscollected[moosicy.chapterc[chapter][num]],ecs,y-64)
			num+=1
			ecs+=32
		}
	}
}