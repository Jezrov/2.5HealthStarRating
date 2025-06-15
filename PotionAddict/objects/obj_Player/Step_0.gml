if (IsFacingRight)
image_xscale = 2;
else
image_xscale = -2;

if keyboard_check(ord("O"))
room_goto(Room1)
if keyboard_check(ord("P"))
room_goto(Shop)

// DEBUG TESTING CONTROLS
if keyboard_check(vk_up)
	Health++;	
if keyboard_check(vk_down)
	Health--;	
if keyboard_check(vk_right)
	MaxHealth++;	
if keyboard_check(vk_left)
	MaxHealth--;	



// clamp Health, Death
if (MaxHealth <= 0) MaxHealth = 0;
if (Health >= MaxHealth) Health = MaxHealth;
if (Health <= 0)
{
	Health = 0;
	instance_destroy(self);
}



// Use Health Potion
if (keyboard_check_pressed(ord("1")) && HealthPotions > 0)
{
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

// directional input and movement
if  keyboard_check(ord("D")) && keyboard_check(ord("A")){}
else if keyboard_check(ord("D"))
{
	IsFacingRight = true;
	if (IsGrounded)	x += GroundSpeed;
	else x+= AirSpeed;
}
else if keyboard_check(ord("A"))
{ 
	IsFacingRight = false;
	if (IsGrounded)	x -= GroundSpeed;
	else x-= AirSpeed;
} 

if keyboard_check(ord("W")) && keyboard_check(ord("S"))
	VerticalFacing = Direction.Neutral
else if keyboard_check(ord("W"))
	VerticalFacing = Direction.Up;
else if keyboard_check(ord("S"))
	VerticalFacing = Direction.Down;
else
	VerticalFacing = Direction.Neutral;	


// gravity
if (y < FloorHeight)
{
	y += FallSpeed;	
	IsGrounded = false;
}
else
	IsGrounded = true;	



// jumping and jump cancelling
if (IsGrounded || VerticalFacing == Direction.Down)
	JumpSpeed = 0;	
else
{
	y -= JumpSpeed;
	JumpSpeed -= JumpAcceleration;
}

// deciding to jump and initializing jump
if (IsGrounded && keyboard_check(vk_space) && !keyboard_check(ord("S")))
{
	JumpSpeed = MaxJumpSpeed;
	y -= JumpSpeed;
}



// attack
if (mouse_check_button_pressed(mb_left) && !(instance_exists(obj_Sword)))
{
	instance_create_layer(x, y, "Player", obj_Sword, {VerticalFacing: VerticalFacing, IsFacingRight: IsFacingRight});
	AttackTimer = 60/6;
}

AttackTimer--;

if (AttackTimer <= 0 && instance_exists(obj_Sword))
	instance_destroy(obj_Sword);
	
	

// Persistent Data , make sure to store all variables

obj_PlayerManager.PlayerHealth        = Health;
obj_PlayerManager.PlayerMaxHealth     = MaxHealth;
obj_PlayerManager.CurrentHealthPotion = HealthPotions;
obj_PlayerManager.CurrentDamagePotion = DamagePotions;
obj_PlayerManager.CurrentSpeedPotion  = SpeedPotions;
obj_PlayerManager.PlayerCoins         = Coins;