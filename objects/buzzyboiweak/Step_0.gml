/// @description Insert description here
// You can write your code in this editor
if(instance_exists(player))
{
	if(place_meeting(x,y-1,player)&&!player.jkey)
	{
		player.y=bbox_top-(point_distance(player.x,player.bbox_bottom,x,bbox_top))
		y+=3
		with(player)
		{
			while(place_meeting(x,y,other))
			{
				y-=1
			}
		}
		sprite_index=beeboistruggle
		player.hsp*=0.1
	
	}
	else if(player.jkey&&place_meeting(x,y-1,player))
	{
		player.vsp=-player.jsp
	}
	else if(player.ukey)
	{
		y-=3
	}
	else
	{
		y-=(y-ystart)/10
		sprite_index=beeboi
	}
}
image_xscale=0.5
image_yscale=0.5