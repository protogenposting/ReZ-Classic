/// @description Insert description here
// You can write your code in this editor
col=instance_place(x,y-32,player)
if(orgin!=id&&instance_exists(orgin))
{
	if(col&&!col.jkey)
	{
		orgin.rot+=25.5/2
		inst=instance_create_depth(x,y,depth+1,effect)
		inst.sprite_index=Sprite67
		if(orgin.rot>=360)
		{
			orgin.rot=1
		}
		col.y=bbox_top-(74/2)
		col.x=x
		col.spinmult=0
	}
	else if(col&&col.jkey)
	{
		if(orgin.rot>270)
		{
			col.vsp-=10
		}
		else if(orgin.rot>180&&orgin.rot<270)
		{
			col.hsp+=10
		}
		else if(orgin.rot>90&&orgin.rot<180)
		{
			col.vsp+=10
		}
		else if(orgin.rot>0&&orgin.rot<90)
		{
			col.hsp-=10
		}
	}
	else if(!col)
	{
		orgin.rot-=(orgin.rot-180)/10
	}
}