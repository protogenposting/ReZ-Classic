/// @description Insert description here
// You can write your code in this editor
if(idle!=Sprite1)
{
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
	if(num2<array_length(moosicy.chapter[chapter]))
	{
		instance_destroy()
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
	if(num2<array_length(moosicy.chapterb[chapter]))
	{
		instance_destroy()
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
	if(num2<array_length(moosicy.chapterc[chapter]))
	{
		instance_destroy()
	}
}
}