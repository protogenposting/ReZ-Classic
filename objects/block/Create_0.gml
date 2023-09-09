/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
if layer_background_get_sprite(back_id) == Sprite22
{
    sprite_index=grass
}
if layer_background_get_sprite(back_id) == Sprite49
{
    sprite_index=Sprite53
}
image_speed=0

tiled=false
index_finder=function(ecs, why, ind){
	//no surrounding bois
	var index=0
	//1 wall below
	if(!collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=1
	}
	//1 wall to the right
	else if(!collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=2
	}
	//1 wall above
	else if(!collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=3
	}
	//1 wall to the left
	else if(collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=4
	}
	else if(!collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=5
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=6
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=7
	}
	else if(!collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=8
	}
	else if(!collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=9
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=10
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=11
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=12
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=13
	}
	else if(collision_point(ecs-60,why,ind,true,false)&&collision_point(ecs+60,why,ind,true,false)&&!collision_point(ecs,why-60,ind,true,false)&&!collision_point(ecs,why+60,ind,true,false))
	{
		index=14
	}
	else if(!collision_point(ecs-60,why,ind,true,false)&&!collision_point(ecs+60,why,ind,true,false)&&collision_point(ecs,why-60,ind,true,false)&&collision_point(ecs,why+60,ind,true,false))
	{
		index=15
	}
	return index;
}

if(room==editor)
{
	with(wall)
	{
		tiled=false
	}
}