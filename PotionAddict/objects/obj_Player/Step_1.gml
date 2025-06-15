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

// Use Damage Potion
if (keyboard_check_pressed(ord("2")) && DamagePotions > 0)
{	
	DamagePotionTolerance += 0.1;
		
	// High
	Damage += 10 /DamagePotionTolerance; // starts at 100 bonus max hp (double!)
	
	// logic set up
	DamagePotionTimerMax = 1200 / DamagePotionTolerance; // starts at 600 ticks == 10 secs
	DamagePotionTimer = DamagePotionTimerMax;
	DoWithdrawalLogicDamagePotion++; // int instead of bool so that you can take multiple potions at once and get even worse withdrawal
	DamagePotions--;
}

if (DamagePotionTimer > 0)
{
	DamagePotionTimer--;
}
else if (DoWithdrawalLogicDamagePotion)
{ // Withdrawal
	Damage -= 10 / (DamagePotionTolerance * DoWithdrawalLogicDamagePotion); // put back to normal
	Damage -= 1 * DamagePotionTolerance; // put below normal
	DoWithdrawalLogicDamagePotion--;
}

if (Damage <= 0) // minimum damage
{
	Damage = 0.1;	
}

