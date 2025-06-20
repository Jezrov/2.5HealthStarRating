
if (instance_exists(obj_Player))
{
	
	// Movement
	var xNextFrame = lerp(x, obj_Player.x, 0.01);
	var yNextFrame = lerp(y, obj_Player.y, 0.01);
	
	
	
	if (x < obj_Player.x)
		{
			XDirectionFactor = -1;
		}
		if (x > obj_Player.x)
		{
			XDirectionFactor = 1;
		}
	image_xscale = XDirectionFactor;
	
	
	SpawnTimer--;
	if (SpawnTimer <= 0)
	{
		instance_create_layer(x + Radius * XDirectionFactor, y - Radius, "Instances", obj_BoidProjectile)
		SpawnTimer = SpawnTimerDuration;
	}
	
	
	if (place_meeting(x, y, obj_Player))
	{
		obj_Player.Health -= Damage; // repeated damage as long as touching
	}
	
	
	// Apply knockback
	xNextFrame += Knockback_X 
	yNextFrame += Knockback_Y 

	// collision check
	if (!place_meeting(xNextFrame, yNextFrame, obj_Mushroom))
	&& (!place_meeting(xNextFrame, yNextFrame, obj_Boid))
	{
		x = xNextFrame;
		y = yNextFrame;
	}

	Knockback_X = lerp(Knockback_X, 0, KnockbackSpeed)
	Knockback_Y = lerp(Knockback_Y, 0, KnockbackSpeed)

	if (place_meeting(x, y, obj_Sword))
	{
		DamageFlash = true;
		
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
				obj_Player.Coins += 10;
				instance_destroy(HealthBar);
				instance_destroy();
				exit;
			}
		}
	}
	else
	{
	    WasHit = false; // Reset once sword is no longer overlapping
	}
	
	

	
	HealthBar.x = x - 16;
	HealthBar.y = y - 74;
	HealthBar.OwnerHealth = Health;
	HealthBar.OwnerMaxHealth = MaxHealth;

	
	
}