HealthPress = false;
DamagePress = false;
SpeedPress = false;
AllPress = false;

if keyboard_check_pressed(ord("1"))
HealthPress = true;

if keyboard_check_pressed(ord("2"))
DamagePress = true;

if keyboard_check_pressed(ord("3"))
SpeedPress = true;

if mouse_check_button_pressed(mb_right)
AllPress = true;





// Use Health Potion
if ((HealthPress || AllPress) && HealthPotions > 0)
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
	Health = MaxHealth;
	DoWithdrawalLogicHealthPotion--;
}





// Use Damage Potion
if ((DamagePress || AllPress) && DamagePotions > 0)
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





// Use Speed Potion
if ((SpeedPress || AllPress) && SpeedPotions > 0)
{	
	SpeedPotionTolerance += 0.1;
		
	// High
	Speed += 10 /SpeedPotionTolerance; // starts at 100 bonus max hp (double!)
	
	// logic set up
	SpeedPotionTimerMax = 1200 / SpeedPotionTolerance; // starts at 600 ticks == 10 secs
	SpeedPotionTimer = SpeedPotionTimerMax;
	DoWithdrawalLogicSpeedPotion++; // int instead of bool so that you can take multiple potions at once and get even worse withdrawal
	SpeedPotions--;
}

if (SpeedPotionTimer > 0)
{
	SpeedPotionTimer--;
}
else if (DoWithdrawalLogicSpeedPotion)
{ // Withdrawal
	Speed -= 10 / (SpeedPotionTolerance * DoWithdrawalLogicSpeedPotion); // put back to normal
	Speed -= 1 * SpeedPotionTolerance; // put below normal
	DoWithdrawalLogicSpeedPotion--;
}

if (Speed <= 0) // minimum Speed
{
	Speed = 0.1;	
}