// Use Health Potion
if (keyboard_check_pressed(ord("1")) && HealthPotions > 0)
{
	DamageFlashTimer = 0; // without this the Invincibility logic makes the potion not even increase health
	
	HealthPotionTolerance += 0.1;
		
	// High
	MaxHealth += 100 / HealthPotionTolerance; // starts at 100 bonus max hp (double!)
	Health = MaxHealth;
	
	// logic set up
	HealthPotionTimerMax = 1200 / HealthPotionTolerance; // starts at 600 ticks == 10 secs
	HealthPotionTimer = HealthPotionTimerMax;
	DoWithdrawalLogicHealthPotion++; // int instead of bool so that you can take multiple potions at once and get even worse withdrawal
	HealthPotions--;
	
	show_debug_message("Health after potion: " + string(Health));
}

if (HealthPotionTimer > 0)
{
	HealthPotionTimer--;
}
else if (DoWithdrawalLogicHealthPotion)
{ // Withdrawal
	MaxHealth -= 100 / (HealthPotionTolerance * DoWithdrawalLogicHealthPotion); // put back to normal
	MaxHealth -= 10 * HealthPotionTolerance; // put below normal
	DoWithdrawalLogicHealthPotion--;
}