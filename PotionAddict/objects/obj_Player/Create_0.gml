image_yscale = 2
enum Direction
{
	Neutral, Up, Down	
};

enum AnimationState
{
	Standing, Walking
};



Health = obj_PlayerManager.Health;
MaxHealth = obj_PlayerManager.MaxHealth;

HealthPotions = obj_PlayerManager.HealthPotions;
HealthPotionTolerance = obj_PlayerManager.HealthPotionTolerance;
HealthPotionTimer = obj_PlayerManager.HealthPotionTimer;
HealthPotionTimerMax = obj_PlayerManager.HealthPotionTimerMax;
DoWithdrawalLogicHealthPotion = obj_PlayerManager.DoWithdrawalLogicHealthPotion;

Damage = obj_PlayerManager.Damage;
DamagePotions = obj_PlayerManager.DamagePotions;
DamagePotionTolerance = obj_PlayerManager.DamagePotionTolerance;
DamagePotionTimer = obj_PlayerManager.DamagePotionTimer;
DamagePotionTimerMax = obj_PlayerManager.DamagePotionTimerMax;
DoWithdrawalLogicDamagePotion = obj_PlayerManager.DoWithdrawalLogicDamagePotion;

Speed = obj_PlayerManager.Speed;
SpeedPotions = obj_PlayerManager.SpeedPotions;
SpeedPotionTolerance = obj_PlayerManager.SpeedPotionTolerance;
SpeedPotionTimer = obj_PlayerManager.SpeedPotionTimer;
SpeedPotionTimerMax = obj_PlayerManager.SpeedPotionTimerMax;
DoWithdrawalLogicSpeedPotion = obj_PlayerManager.DoWithdrawalLogicSpeedPotion;

Coins = obj_PlayerManager.Coins;




HealthBar = instance_create_layer(x, y + 32, "UI", obj_EnemyHealthBar, 
{
	OwnerHealth : Health,
	OwnerMaxHealth : MaxHealth
}
);
