/// @description Insert description here
// You can write your code in this editor
i[0]-=1
i[1]-=1
var hpper=hp/mhp
diry-=(diry-point_direction(x,y,player.x,player.y))/60 
draw_set_alpha(i[1]/360)
draw_line(x,y,x+lengthdir_x(9999,diry),y+lengthdir_y(9999,diry))
draw_set_alpha(1)
if(i[1]<=0&&hpper<=0.75)
{
	inst=instance_create_depth(x,y,0,goolaunch)
	inst.speed=50
	inst.direction=diry
	i[1]=360
}
if(hpper<=0.5)
{
var dir1=diry-25
var dir2=diry+25
draw_set_alpha(i[0]/360)
draw_line(x,y,x+lengthdir_x(9999,dir1),y+lengthdir_y(9999,dir1))
draw_line(x,y,x+lengthdir_x(9999,dir2),y+lengthdir_y(9999,dir2))
draw_set_alpha(1)
if(i[0]<=0)
{
	inst=instance_create_depth(x,y,0,goolaunch)
	inst.speed=50
	inst.direction=dir1
	inst=instance_create_depth(x,y,0,goolaunch)
	inst.speed=50
	inst.direction=dir2
	i[0]=360
}
}
draw_sprite(sprite_index,0,x,y)
draw_healthbar(x-64,y-32,x+64,y-16,(hp/mhp)*100,c_black,c_red,c_green,0,true,false)

var why=y+720

draw_rectangle_color(0,why,room_width,why+1366,c_black,c_black,c_black,c_black,false)

col=collision_rectangle(0,why,room_width,why+1366,player,true,true)

if(col)
{
	inst=instance_create_depth(player.x,player.y,0,spike)
	inst.alarm[0]=2
}