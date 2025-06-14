
draw_self();

if (DamageFlashTimer <= 0)
{
	DamageFlash = false;	
}

if (DamageFlash)
{
	DamageFlashTimer--;	
	
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, 1);
}
else
{
	DamageFlashTimer = DamageFlashTimerDuration;	
}