// Knockback creation

Knockback_X = 0
Knockback_Y = 0
KnockbackForce = 20
KnockbackSpeed = 0.2

HealthBar = instance_create_layer(x, y + 32, "UI", obj_EnemyHealthBar, 
{
	OwnerHealth : Health,
	OwnerMaxHealth : MaxHealth
}
);