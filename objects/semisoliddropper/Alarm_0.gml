/// @description Insert description here
// You can write your code in this editor
inst=instance_create_depth(x,y,0,semisolid)
inst.vsp=3
if(choose(true,false,false,false,false,false))
{
	insty=instance_create_depth(x,inst.bbox_top-32,0,springy)
	insty.vspeed=3
}
alarm[0]=random_range(1,120)