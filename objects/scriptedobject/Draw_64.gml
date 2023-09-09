/// @description Insert description here
// You can write your code in this editor
if(showing)
{
	var ecs=view_get_wport(view_current)-256
	var why=0
	draw_rectangle(ecs,why,ecs+256,why+256,true)
	var num=0
	repeat(array_length(commands))
	{
		draw_text(ecs,why,command[commands[num].command].name+"("+array_to_string(commands[num].syntax)+")")
		why+=16
		num+=1
	}
	why+=256
	draw_rectangle(ecs,why,ecs+256,why+64,true)
	draw_text(ecs,why,command[commselected].name)
	if(keyboard_check_pressed(vk_enter))
	{
		var arrayy = {
			command:commselected,
			syntax:[0,0,0,0]
		}
		var bnum=0
		repeat(command[commselected].args)
		{
			arrayy.syntax[bnum]=get_integer(command[commselected].name+"("+command[commselected].syntax+")",0)
			bnum+=1
		}
		array_push(commands,arrayy)
	}
	if(keyboard_check_pressed(vk_control)&&keyboard_check_pressed(ord("Z"))||keyboard_check_pressed(vk_backspace))
	{
		array_delete(commands,array_length(commands)-1,1)
	}
}