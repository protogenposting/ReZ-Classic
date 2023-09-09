/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(roomidui))
{
	instance_create_depth(0,0,0,roomidui)
}
chapterid=0
b_side=false
c_side=false
chapter[2]=[Level_11]
chapterb[2]=[]
chapter[1]=[Tutorial,Level_1,Level_2,Level_3,Level_4,Level_5,Level_6,Level_7,Level_8,Level_9,Level_10]
chapterb[1]=[Level_1B,Level_2B,Level_3B,Level_4B]
chapter[0]=[cutscene1,cutscene2,hub]
chapterb[0]=[0]
chapterc[0]=[]
chapterc[1]=[]
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
			chapterid=num
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
			chapterid=num
			b_side=true
			break;
		}
		num2+=1
	}
	num+=1
}
var num=0
var num2=0
repeat(array_length(chapterc))
{
	num2=0
	repeat(array_length(chapterc[num]))
	{
		if(room==chapterc[num][num2])
		{
			chapterid=num
			c_side=true
			break;
		}
		num2+=1
	}
	num+=1
}

moosicyo=moosic

if chapterid==2
{
    moosicyo=chapter2moosic
}
if chapterid==0
{
    moosicyo=hubtheme
}
if chapterid==3
{
    moosicyo=c3theme
}
if (b_side&&chapterid==1)
{
    moosicyo=c1bside
}
if (b_side&&chapterid==2)
{
    moosicyo=c2bside
}
if(room==editor)
{
	moosicyo=editingsong
}
if(instance_exists(boss1))
{
	moosicyo=bosstheme
}
if(moosicyo==moosic)
{
	audio_sound_loop(moosicyo,true)
	audio_sound_loop_start(moosicyo,96)
	audio_sound_loop_end(moosicyo,384)
}
if(!audio_is_playing(moosicyo))
{
	audio_stop_all()
	audio_play_sound(moosicyo,700,true)
}