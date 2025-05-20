
// move left
if keyboard_check(ord("A"))
{
	if (IsGrounded)	x -= GroundSpeed;
	else x-= AirSpeed;
}

// move right
if keyboard_check(ord("D"))
{
	if (IsGrounded)	x += GroundSpeed;
	else x+= AirSpeed;
}



// gravity
if (y < FloorHeight)
{
	y += FallSpeed;	
	IsGrounded = false;
}
else
{
	IsGrounded = true;	
}



// jump
if (keyboard_check(vk_space) && IsGrounded)
{
	IsJumping = true;
	JumpSpeed = MaxJumpSpeed;
}

if (keyboard_check(vk_space) && IsJumping)
{
	if (y > FloorHeight - JumpHeight)
	{
		y -= JumpSpeed;
		JumpSpeed -= 0.25;
	}
	else
	{
		IsJumping = false;	
	}
}