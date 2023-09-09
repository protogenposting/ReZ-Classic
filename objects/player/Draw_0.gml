/// @description Insert description here
// You can write your code in this editor
var alp = al
coly=c_white
if(phasing)
{
	alp-=0.4
}
image_yscaley-=(image_yscaley-image_yscale)/10
image_xscaleyy-=(image_xscaleyy-image_xscaley)/10
draw_sprite_ext(sprite_index,image_index_real,x,y,image_xscaley,image_yscaley,rottyo+((hsp*vsp)/15),coly,alp)
if(iy[3]<360)
{
draw_healthbar(x-64,y-96,x+64,y-64,(iy[3]/360)*100,c_black,c_red,c_green,0,false,false)
}