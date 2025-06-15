// red max health
draw_sprite_part(spr_EnemyHealthBar, 0, 0, 0, sprite_width, sprite_height, x, y);
	
// green health
draw_sprite_part(spr_EnemyHealthBar, 1, 0, 0, sprite_width * (Owner.Health / Owner.MaxHealth), sprite_height, x, y);
	