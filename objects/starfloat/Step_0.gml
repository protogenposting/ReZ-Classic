/// @description Insert description here
// You can write your code in this editor
image_angle+=2
if(instance_exists(starwallbreak)&&point_distance(player.x,player.y,starwallbreak.x,starwallbreak.y)<200)
{
	inst=instance_nearest(x,y,starwallbreak)
	targx=inst.x
	targy=inst.y
	x-=(x-targx)/10
	y-=(y-targy)/10
}
else if(instance_exists(starwall)&&point_distance(player.x,player.y,starwall.x,starwall.y)<1000)
{
	inst=instance_nearest(x,y,starwall)
	targx=inst.x
	targy=inst.y
	x-=(x-targx)/60
	y-=(y-targy)/60
}
else
{
	x-=(x-targx)/60
	y-=(y-targy)/60
}