/// @description Insert description here
// You can write your code in this editor
talking=false
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
			b_side=true
			break;
		}
		num2+=1
	}
	num+=1
}