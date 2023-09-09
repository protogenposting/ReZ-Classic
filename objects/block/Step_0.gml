/// @description Insert description here
// You can write your code in this editor
if(instance_exists(starcoin))
{
	depth=starcoin.depth-10
}
if(place_meeting(x,y,player))
{
	if(image_alpha>0)
	{
	image_alpha-=0.01
	}
}
else
{
	if(image_alpha<1)
	{
	image_alpha+=0.01
	}
}