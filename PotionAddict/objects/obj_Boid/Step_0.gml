
if (instance_exists(obj_Player))
{
	
	// Movement
	x = lerp(x, obj_Player.x, 0.01);
	y = lerp(y, obj_Player.y, 0.01);
	
	if (x < obj_Player.x) // Chase player simple
		{
			image_xscale = -1;
		}
		if (x > obj_Player.x)
		{
			image_xscale = 1;
		}
	
	
	
	SpawnTimer--;
	if (SpawnTimer <= 0)
	{
		instance_create_layer(x, y, "Instances", obj_BoidProjectile)
		SpawnTimer = SpawnTimerDuration;
	}
	
	
	
	// Apply knockback
	x += Knockback_X 
	y += Knockback_Y 

	Knockback_X = lerp(Knockback_X, 0, KnockbackSpeed)
	Knockback_Y = lerp(Knockback_Y, 0, KnockbackSpeed)

	if (place_meeting(x, y, obj_Sword))
	{
		if (WasHit == false)
		{
			if (obj_Player.VerticalFacing == Direction.Neutral)
			{
				if (obj_Player.IsFacingRight)
				{
					Knockback_X += KnockbackForce
				}
				else
				{
					Knockback_X -= KnockbackForce
				}
			}
			else if (obj_Player.VerticalFacing == Direction.Down)
			{
				Knockback_Y  += KnockbackForce/2
			}
			else if (obj_Player.VerticalFacing == Direction.Up)
			{
				Knockback_Y  -= KnockbackForce/2
			}
		
			Health -= obj_Player.Damage;
			WasHit = true; // prevents repeated damage
			if (Health <= 0)
			{
				instance_destroy();
				exit;
			}
		}
	}
	else
	{
	    WasHit = false; // Reset once sword is no longer overlapping
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}