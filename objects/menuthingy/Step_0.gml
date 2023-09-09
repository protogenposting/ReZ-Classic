/// @description Insert description here
// You can write your code in this editor
if(!paused)
{
if(instance_exists(player))
{
i+=1
truei+=1
if(tasmode)
	{
		var arrayy = {lkey: player.lkey,
		rkey: player.rkey,
		lkey_pressed: player.lkey_pressed,
		rkey_pressed: player.rkey_pressed,
		ukey: player.ukey,
		dkey: player.dkey,
		jkey: player.jkey,
		gkey: player.gkey,
		dashkey: player.dashkey,
		skey: player.skey,
		}
		inputs[truei]=arrayy
		
	}
if(i>=60)
{
	i=0
	s+=1
	if(s>=60)
	{
		s=0
		m+=1
	}
	if(m>=60)
	{
		m=0
		h+=1
	}
}
}

}
if(room<=cutscene1)
{
	paused=false
}
if(room==editor)
{
	with(player)
	{
		var arrayboi={
			x : player.x,
			y : player.y
		}
		array_push(other.player_cords,arrayboi)
	}
}