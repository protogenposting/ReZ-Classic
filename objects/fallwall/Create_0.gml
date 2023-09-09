/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
if layer_background_get_sprite(back_id) == Sprite22
{
    sprite_index=grass
}
/*if(menuthingy.hfuse)
{
col1=instance_place(x+1,y,wall)

while(col1&&image_yscale==1)
{
	x+=32
	image_xscale+=col1.image_xscale
	instance_destroy(col1)
	col1=instance_place(x+1,y,wall)
}
}*/
fallen=false
ogx=x
ogy=y