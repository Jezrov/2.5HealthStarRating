Knockback_X = 0
Knockback_Y = 0
KnockbackForce = 60
KnockbackSpeed = 0.2
SpawnTimer = SpawnTimerDuration

HealthBar = instance_create_layer(x, y + 32, "UI", obj_EnemyHealthBar, 
{
	OwnerHealth : Health,
	OwnerMaxHealth : MaxHealth
}
);