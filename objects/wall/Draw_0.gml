/// @description Insert description here
// You can write your code in this editor
var insidecamera = point_in_rectangle(x,bbox_bottom,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))||point_in_rectangle(x,bbox_top,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))||point_in_rectangle(bbox_right,y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))||point_in_rectangle(bbox_left,y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))
if(fps>10&&insidecamera||menuthingy.tasmode)
{
	var iy=0
	var ecs=(x-((image_xscale*sprite_get_width(sprite_index))/2))+32
	var why=(y-((image_yscale*sprite_get_height(sprite_index))/2))+32
	for(i=0; i<image_xscale; i++){
	    for(j=0; j<image_yscale; j++){
			if(!tiled)
			{
				index[iy]=index_finder(ecs+(i*sprite_get_width(sprite_index)),why+(j*sprite_get_height(sprite_index)),object_index)
			}
			if(ecs+(i*sprite_get_width(sprite_index))>=bbox_right)
			{
				 draw_sprite_ext(sprite_index, index[iy], (ecs+(i*sprite_get_width(sprite_index)))-16, why+(j*sprite_get_height(sprite_index)),0.5,1,0,coly,1);
			}
			else if(why+(j*sprite_get_height(sprite_index))>=bbox_bottom)
			{
				 draw_sprite_ext(sprite_index, index[iy], ecs+(i*sprite_get_width(sprite_index)), (why+(j*sprite_get_height(sprite_index)))-16,1,0.5,0,coly,1);
			}
			else
			{
				 draw_sprite_ext(sprite_index, index[iy], ecs+(i*sprite_get_width(sprite_index)), (why+(j*sprite_get_height(sprite_index))),1,1,0,coly,1);
			}
			iy+=1
	    }
	}
	tiled=true
}