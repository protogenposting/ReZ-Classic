/// @description Insert description here
// You can write your code in this editor
if(instance_exists(player))
{
	var num=0
	repeat(array_length(commands))
	{
		if(commands[num].command==2)
		{
			if(!command[commands[num].command].func(id,commands[num].syntax[0],commands[num].syntax[1],commands[num].syntax[2]))
			{
				continue;
			}
		}
		else
		{
		command[commands[num].command].func(id,commands[num].syntax[0],commands[num].syntax[1],commands[num].syntax[2])
		}
		num+=1
	}
}