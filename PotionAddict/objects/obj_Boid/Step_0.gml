
if (instance_exists(obj_Player))
{
	
	
	
	
	
	// Apply knockback
	x += Knockback_X 
	y += Knockback_Y 

	Knockback_X = lerp(Knockback_X, 0, KnockbackSpeed)
	Knockback_Y = lerp(Knockback_Y, 0, KnockbackSpeed)

	if (place_meeting(x, y, obj_Sword))
	{
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