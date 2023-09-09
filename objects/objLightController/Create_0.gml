///Create Event for objLightController
renderer = new BulbRenderer(c_dkgray, BULB_MODE.HARD_BM_MAX, false);
light = new BulbLight(objLightController.renderer, testy, 0, player.x, player.y)
if(instance_exists(starcoin))
{
lightstar = new BulbLight(objLightController.renderer, testy, 0, starcoin.x, starcoin.y);
}
var num=0
repeat(instance_number(wall))
{
	inst=instance_find(wall,num)
	if(inst.object_index==wall)
	{
	with(inst)
	{
		//Create a new occluder that the player will use to block light
		occluder = new BulbDynamicOccluder(objLightController.renderer);

		//Move the occluder on top of the player
		occluder.x = x;
		occluder.y = y;

		//Define a simple rectangular occluder that fits the bounding box of the player's sprite
		//Note that edge coordinates are relative to the occluder's x/y position
		//N.B. Don't forget to give objPlayer a sprite otherwise this code won't work!
		occluder.AddEdge(bbox_left  - x, bbox_top    - y, bbox_right - x, bbox_top    - y);
		occluder.AddEdge(bbox_right - x, bbox_top    - y, bbox_right - x, bbox_bottom - y);
		occluder.AddEdge(bbox_right - x, bbox_bottom - y, bbox_left  - x, bbox_bottom - y);
		occluder.AddEdge(bbox_left  - x, bbox_bottom - y, bbox_left  - x, bbox_top    - y);
	}
	}
	num+=1
}