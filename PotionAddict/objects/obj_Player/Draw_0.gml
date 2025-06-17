draw_self();

if (AnimState == AnimationState.Standing)
{
	sprite_index = spr_PlayerIdle;
}
else if (AnimState == AnimationState.Walking)
{
	sprite_index = spr_PlayerWalking;
}


if (DamageFlashTimer <= 0)
{
	DamageFlash = false;	
	Invincible = false;
}

if (DamageFlash)
{
	if (!Invincible)
	{
		Invincible = true;
		InvincibilityHealth = Health;
	}
	
	DamageFlashTimer--;	
	
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, 1);
}
else
{
	DamageFlashTimer = DamageFlashTimerDuration;	
}

if (Invincible)
{
	Health = InvincibilityHealth;	
}