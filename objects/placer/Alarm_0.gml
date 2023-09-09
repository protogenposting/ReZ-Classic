/// @description Insert description here
// You can write your code in this editor
if(i<=0)
{
if(obj==player||obj==enemy||obj==physicblock||obj==antiphysicblock||obj==Checkpoint||obj==coongunner||obj==bubble||obj==coonbubbler||obj==playerantispingate)
	{
		inst=instance_create_depth(x,y,depth,bufferobject)
		inst.obj=obj
	}
	else
	{
		inst=instance_create_depth(x,y,depth,obj)
	}
	with(inst)
	{
		move_snap(64,64)
	}
}