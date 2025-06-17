// black background
draw_self();

//draw_set_font();

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
	var HealthPotionsString = string_concat("[1] HP: ", obj_Player.HealthPotions, " { ", obj_Player.MaxHealth/100, " } { ", obj_Player.HealthPotionTimer, " }");
	draw_text_color(x - 20, 5 + y + sprite_height / 2 + 15 * 1, HealthPotionsString, c_white, c_white, 0, c_white, 1);
	
	var StrengthPotionsString = string_concat("[2] DMG: ", obj_Player.DamagePotions, " { ", obj_Player.Damage/10, " } { ", obj_Player.DamagePotionTimer, " }");
	draw_text_color(x - 20, 5 + y + sprite_height / 2 + 15 * 3, StrengthPotionsString, c_white, c_white, 0, c_white, 1);
	
	var SpeedPotionsString = string_concat("[3] SPD: ", obj_Player.SpeedPotions, " { ", obj_Player.Speed, " } { ", obj_Player.SpeedPotionTimer, " }");
	draw_text_color(x - 20, 5 + y + sprite_height / 2 + 15 * 5, SpeedPotionsString, c_white, c_white, 0, c_white, 1);
	
	draw_text_color(x - 20, 5 + y + sprite_height / 2 + 15 * 7, "[Right-Click] ALL", c_white, c_white, 0, c_white, 1);
}

