/// @description Insert description here
// You can write your code in this editor
if(erasing&&!instance_exists(player))
		{
			col=collision_point(mouse_x,mouse_y,all,true,true)
			if(col&&mouse_check_button(mb_left))
			{
				instance_destroy(col)
			}
		}