if (IsFacingRight)
image_xscale = 2;
else
image_xscale = -2;

if keyboard_check(ord("O"))
room_goto(Room1)
if keyboard_check(ord("P"))
room_goto(Shop)

// DEBUG TESTING CONTROLS
if keyboard_check(vk_left)
	DamagePotionTimer -= 10;
if keyboard_check(vk_right)
	DamagePotionTimer += 10;
if keyboard_check(vk_up)
	DamagePotionTimer = DamagePotionTimerMax;
if keyboard_check(vk_down)
	DamagePotionTimer = 0;

var xNextFrame = x;
var yNextFrame = y;

// clamp Health, Death
//if (MaxHealth <= 0) MaxHealth = 0;
//if (Health >= MaxHealth) Health = MaxHealth;
if (Health <= 0)
{
	Health = 0;
	instance_destroy(HealthBar);
	instance_destroy();
	room_goto(Menu);
}


// directional input and movement
if  keyboard_check(ord("D")) && keyboard_check(ord("A")){}
else if keyboard_check(ord("D"))
{
	IsFacingRight = true;
	if (IsGrounded)	xNextFrame += GroundSpeed;
	else xNextFrame+= AirSpeed;
}
else if keyboard_check(ord("A"))
{ 
	IsFacingRight = false;
	if (IsGrounded)	xNextFrame -= GroundSpeed;
	else xNextFrame-= AirSpeed;
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
if (yNextFrame < FloorHeight)
{
	yNextFrame += FallSpeed;	
	IsGrounded = false;
}
else
	IsGrounded = true;	



// jumping and jump cancelling
if (IsGrounded || VerticalFacing == Direction.Down)
	JumpSpeed = 0;	
else
{
	yNextFrame -= JumpSpeed;
	JumpSpeed -= JumpAcceleration;
}

// deciding to jump and initializing jump
if (IsGrounded && keyboard_check(vk_space) && !keyboard_check(ord("S")))
{
	JumpSpeed = MaxJumpSpeed;
	yNextFrame -= JumpSpeed;
}

// collision check - DONT DO COLLISION CHECK WITH ENEMIES OR GET STUCK
	//if (!place_meeting(xNextFrame, yNextFrame, obj_Wall???))
	//{
		x = xNextFrame;
		y = yNextFrame;
	//}

// attack
if (mouse_check_button_pressed(mb_left) && !(instance_exists(obj_Sword)))
{
	instance_create_layer(x, y, "Player", obj_Sword, {VerticalFacing: VerticalFacing, IsFacingRight: IsFacingRight});
	AttackTimer = 60/6;
}

AttackTimer--;

if (AttackTimer <= 0 && instance_exists(obj_Sword))
	instance_destroy(obj_Sword);
	
	
	
if (Health < HealthLastFrame)
{
	DamageFlash = true;	
}
HealthLastFrame = Health;
	
	
	
		
HealthBar.x = x - 16;
HealthBar.y = y - 74;
HealthBar.OwnerHealth = Health;
HealthBar.OwnerMaxHealth = MaxHealth;
	
	

// Persistent Data , make sure to store all variables

obj_PlayerManager.PlayerHealth			   = Health;
obj_PlayerManager.PlayerMaxHealth		  = MaxHealth;
obj_PlayerManager.HealthPotions			 = HealthPotions;
obj_PlayerManager.HealthPotionTolerance = HealthPotionTolerance;
obj_PlayerManager.HealthPotionTimer = HealthPotionTimer;
obj_PlayerManager.HealthPotionTimerMax = HealthPotionTimerMax;
obj_PlayerManager.DoWithdrawalLogicHealthPotion = DoWithdrawalLogicHealthPotion;

obj_PlayerManager.Damage = Damage;
obj_PlayerManager.DamagePotions = DamagePotions;
obj_PlayerManager.DamagePotionTolerance = DamagePotionTolerance;
obj_PlayerManager.DamagePotionTimer = DamagePotionTimer;
obj_PlayerManager.DamagePotionTimerMax = DamagePotionTimerMax;
obj_PlayerManager.DoWithdrawalLogicDamagePotion = DoWithdrawalLogicDamagePotion;

obj_PlayerManager.SpeedPotions = SpeedPotions;

obj_PlayerManager.Coins         = Coins;