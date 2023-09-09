/// @description Insert description here
// You can write your code in this editor
if(room==settings||room==menu)
{
var ecs=choose(0,room_width/2,room_width)
var why=choose(0,room_height/2,room_height)

while(ecs==why)
{
	var why=choose(0,room_height/2,room_height)
}
instance_create_depth(ecs,why,0,floatyboi)
alarm[0]=30
}