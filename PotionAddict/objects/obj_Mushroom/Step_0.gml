if (instance_exists(obj_Player))
{

	if (x < obj_Player.x)
		{
			XDirectionFactor = -1;
		}
		if (x > obj_Player.x)
		{
			XDirectionFactor = 1;
		}
	image_xscale = XDirectionFactor;

	var xNextFrame = x;
	var yNextFrame = y;

	// Gravity Applied
	if (yNextFrame < FloorHeight)
	{
		yNextFrame += FallSpeed;	
		IsGrounded = false;
	}
	else
	{
		IsGrounded = true;	
	}


	SeenBoxSize = 600; // Bounding Box For AI

	
	// Checks if the player is inside its SeenBox and if true chase
	if (obj_Player.x > bbox_left - SeenBoxSize && obj_Player.x < bbox_right + SeenBoxSize && 
		obj_Player.y > bbox_top - SeenBoxSize && obj_Player.y < bbox_bottom + SeenBoxSize)
		{
			if (x < obj_Player.x) // Chase player simple
			{
				xNextFrame += ChaseSpeed;
			}
			if (x > obj_Player.x)
			{
				xNextFrame -= ChaseSpeed;
			}
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

	if (place_meeting(x, y, obj_Player))
	{
		obj_Player.Health -= Damage; // repeated damage as long as touching
	}

	if (place_meeting(x, y, obj_Sword))
	{
		DamageFlash = true;
		
		if (WasHit == false)
		{
			if (obj_Player.IsFacingRight)
			{
				Knockback_X += KnockbackForce
			}
			else
			{
				Knockback_X -= KnockbackForce
			}
		
			Health -= obj_Player.Damage;
			WasHit = true; // prevents repeated damage
			if (Health <= 0)
			{
				obj_Player.Coins += 2;
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