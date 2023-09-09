/// @description Insert description here
// You can write your code in this editor
if(editormode&&room>Level_9)
{
	room_goto(editor)
}
if(paused)
{
	with(all)
	{
		paused=true
	}
	with(player)
	{
		lkey=false
		rkey=false
		lkey_pressed=false
		rkey_pressed=false
		ukey=false
		dkey=false
		jkey=false
		gkey=false
		dashkey=false
		skey=false
		paused=true
	}
}
else if(instance_exists(player))
{
	with(all)
	{
		paused=false
	}
	with(player)
	{
		iyy=other.truei
		paused=false
		lkey=keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)||gamepad_axis_value(0, gp_axislh)<0
		rkey=keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)||gamepad_axis_value(0, gp_axislh)>0
		lkey_pressed=keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))||gamepad_button_check_pressed(0,gp_padl)||gamepad_axis_value(0, gp_axislh)<0&&!lstickpressed
		rkey_pressed=keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))||gamepad_button_check_pressed(0,gp_padr)||gamepad_axis_value(0, gp_axislh)>0&&!rstickpressed
		ukey=keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)||gamepad_axis_value(0, gp_axislv)<0
		dkey=keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)||gamepad_axis_value(0, gp_axislv)>0
		jkey=keyboard_check(ord("Z"))||keyboard_check(vk_space)||gamepad_button_check(0,gp_face1)
		jkey_released=keyboard_check_released(vk_up)||keyboard_check_released(vk_space)||gamepad_button_check_released(0,gp_face1)
		jkey_pressed=keyboard_check_pressed(vk_up)||keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
		gkey=false
		dashkey=keyboard_check_pressed(vk_shift)||keyboard_check_pressed(ord("C"))||gamepad_button_check_pressed(0,gp_face3)
		skey=keyboard_check(vk_lcontrol)||keyboard_check(ord("F"))||gamepad_button_check(0,gp_shoulderlb)||gamepad_button_check(0,gp_shoulderrb)
		savestatekey=keyboard_check_pressed(vk_tab)||gamepad_button_check_pressed(0,gp_face2)
		loadstatekey=keyboard_check_pressed(vk_ralt)||gamepad_button_check_pressed(0,gp_face4)
		if(other.tasplaymode)
		{
			if(!variable_instance_exists(id,"tasinputs"))
			{
				tasinputs=other.load_inputs()
			}
			if(array_length(tasinputs)+1<=iyy)
			{
				show_message("tas recording has ended")
				game_end()
			}
			lkey=tasinputs[iyy+1].lkey
			rkey=tasinputs[iyy+1].rkey
			lkey_pressed=tasinputs[iyy+1].lkey_pressed
			rkey_pressed=tasinputs[iyy+1].rkey_pressed
			ukey=tasinputs[iyy+1].ukey
			dkey=tasinputs[iyy+1].dkey
			jkey=tasinputs[iyy+1].jkey
			gkey=tasinputs[iyy+1].gkey
			dashkey=tasinputs[iyy+1].dashkey
			skey=tasinputs[iyy+1].skey
		}
	}
}