/// @description Insert description here
// You can write your code in this editor
draw_self()
col1=collision_line(x,y,x+lengthdir_x(99999,image_angle),y+lengthdir_y(99999,image_angle),wall,true,true)
col3=collision_line(x,y,x+lengthdir_x(99999,image_angle),y+lengthdir_y(99999,image_angle),mirrorwall,true,true)
if(col1&&!col3)
{
	draw_line(x,y,col1.x,col1.y)
	col2=collision_line(x,y,col1.x,col1.y,player,true,true)
}
else if(!col3)
{
	draw_line(x,y,x+lengthdir_x(99999,image_angle),y+lengthdir_y(99999,image_angle))
	col2=collision_line(x,y,x+lengthdir_x(99999,image_angle),y+lengthdir_y(99999,image_angle),player,true,true)
}
var ecs=x
var why=y
var ang = image_angle
repeat(instance_number(mirrorwall)+1)
{
	col3=collision_line(ecs,why,ecs+lengthdir_x(99999,ang),why+lengthdir_y(99999,ang),mirrorwall,true,true)
	if(col3)
	{
		draw_line(ecs,why,col3.x,col3.y)
		col2=collision_line(ecs,why,col3.x,col3.y,player,true,true)
		ang+=180
		ecs=col3.x
		why=col3.y
	}
	else
	{
		draw_line(ecs,why,ecs+lengthdir_x(99999,ang),why+lengthdir_y(99999,ang))
		col2=collision_line(ecs,why,ecs+lengthdir_x(99999,ang),why+lengthdir_y(99999,ang),player,true,true)
		break;
	}
}
if(col2)
{
	inst=instance_create_depth(player.x,player.y,depth,spike)
	inst.alarm[0]=2
}