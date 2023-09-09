/// @description Insert description here
// You can write your code in this editor
if(room==editor&&!instance_exists(player))
{
var num=0
repeat(array_length(player_cords)-1)
{
	draw_line(player_cords[num].x,player_cords[num].y,player_cords[num+1].x,player_cords[num+1].y)
	num+=1
}
if(erasing&&!instance_exists(player)&&alarm[2]<=0)
		{
			draw_sprite(eraser,0,mouse_x,mouse_y)
			alarm[2]=2
		}
		
var ecs=-32
var why=-32

repeat(room_height/64)
{
	repeat(room_width/64)
	{
		draw_set_alpha(gopacity)
		draw_rectangle(ecs,why,ecs+64,ecs+64,true)
		draw_set_alpha(1)
		ecs+=64
	}
	ecs=-32
	why+=64
}
}

if(tasmode)
{
	with(player)
	{
		draw_trajectory(hsp,vsp,grav,60,movespd,id)
	}
}