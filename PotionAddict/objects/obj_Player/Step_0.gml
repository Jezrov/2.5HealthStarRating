


// directional input and movement
if keyboard_check(ord("W"))
	CurrentDirection = Direction.Up;
	
else if keyboard_check(ord("A"))
{
	CurrentDirection = Direction.Left;
	if (IsGrounded)	x -= GroundSpeed;
	else x-= AirSpeed;
} 

else if keyboard_check(ord("S"))
	CurrentDirection = Direction.Down;
	
else if keyboard_check(ord("D"))
{
	CurrentDirection = Direction.Right;
	if (IsGrounded)	x += GroundSpeed;
	else x+= AirSpeed;
}

else CurrentDirection = Direction.Neutral;



// gravity
if (y < FloorHeight)
{
	y += FallSpeed;	
	IsGrounded = false;
}
else
	IsGrounded = true;	



// jumping and jump cancelling
if (IsGrounded || CurrentDirection == Direction.Down)
	JumpSpeed = 0;	
else
{
	y -= JumpSpeed;
	JumpSpeed -= JumpAcceleration;
}

// deciding to jump and initializing jump
if (IsGrounded && keyboard_check(vk_space))
{
	JumpSpeed = MaxJumpSpeed;
	y -= JumpSpeed;
}



// attack
if (mouse_check_button_pressed(mb_left) && !(instance_exists(obj_Sword)))
{
	instance_create_layer(x, y, "Instances", obj_Sword, {CurrentDirection: CurrentDirection});
	AttackTimer = 60/6;
}

AttackTimer--;

if (AttackTimer <= 0 && instance_exists(obj_Sword))
	instance_destroy(obj_Sword);