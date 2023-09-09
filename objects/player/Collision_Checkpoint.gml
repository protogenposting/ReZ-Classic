spawnx = other.x
spawny = other.y

inst=instance_create_depth(other.x,other.y,depth,effect)
inst.sprite_index=Sprite19

instance_destroy(other)