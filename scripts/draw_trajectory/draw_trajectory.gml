// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_trajectory(hsp,vsp,grav,len,movespd,obj){
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			oldwhy=twhy
			oldecs=tecs
			tvsp+=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			oldwhy=twhy
			oldecs=tecs
			tvsp-=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			if(thsp>-movespd)
			{
				thsp-=movespd
			}
			oldwhy=twhy
			oldecs=tecs
			tvsp+=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			if(thsp>-movespd)
			{
				thsp-=movespd
			}
			oldwhy=twhy
			oldecs=tecs
			tvsp-=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			if(thsp<movespd)
			{
				thsp+=movespd
			}
			oldwhy=twhy
			oldecs=tecs
			tvsp+=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		var thsp=hsp
		var tvsp=vsp
		var tecs=x
		var twhy=y
		var oldecs=xprevious
		var oldwhy=yprevious
		repeat(len)
		{
			if(thsp<movespd)
			{
				thsp+=movespd
			}
			oldwhy=twhy
			oldecs=tecs
			tvsp-=grav
			twhy+=tvsp
			tecs+=thsp
			draw_line(oldecs,oldwhy,tecs,twhy)
			if(collision_point(tecs,twhy,spike,true,true))
			{
				draw_line(tecs-16,twhy-16,tecs+16,twhy+16)
				draw_line(tecs-16,twhy+16,tecs-16,twhy+16)
				draw_circle(tecs,twhy,16,true)
				break;
			}
			if(collision_point(tecs,twhy,wall,true,true))
			{
				if(obj.iy[2]>0)
				{
					tvsp*=-1
				}
				else
				{
					break;
				}
			}
		}
		
	}