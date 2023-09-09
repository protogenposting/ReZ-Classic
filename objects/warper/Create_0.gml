warpid=0

searchids=function(){
	var num=0
	var inst = -1
	repeat(instance_number(warper))
	{
		inst=instance_find(warper,num)
		if(inst.id!=id)
		{
			if(warpid==inst.warpid)
			{
				break;
			}
		}
		num+=1
	}
	return inst;
}