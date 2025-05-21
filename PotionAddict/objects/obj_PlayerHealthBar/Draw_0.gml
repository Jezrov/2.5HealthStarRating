// black background
draw_self();

if (instance_exists(obj_Player))
{
	// white timer
	draw_sprite_part(spr_PlayerHealthBar, 1, 0, 0, sprite_width * obj_Player.HealthPotionTimer / obj_Player.HealthPotionTimerMax, sprite_height, x, y);
	
	// dark red starter max health
	draw_sprite_part(spr_PlayerHealthBar, 2, 0, 0, sprite_width, sprite_height, x, y);
	
	// red max health
	draw_sprite_part(spr_PlayerHealthBar, 3, 0, 0, sprite_width * obj_Player.MaxHealth * 0.005, sprite_height, x, y);
	
	// green health
	draw_sprite_part(spr_PlayerHealthBar, 4, 0, 0, sprite_width * obj_Player.Health * 0.005, sprite_height, x, y);
	
	// text num of health potions in inventory
	draw_text_color(x - 20, y + sprite_height / 2, obj_Player.HealthPotions, 1, 1, 0, 1, 1);
}

