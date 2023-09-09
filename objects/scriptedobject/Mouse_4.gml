/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(player))
{
	var tempshowing=!showing
	with(scriptedobject)
	{
		showing=false
	}
	showing=tempshowing
}