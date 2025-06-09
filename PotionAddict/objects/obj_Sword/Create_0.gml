
// initialize offset values before modifying them based on direction
XOffset = obj_Player.sprite_width * 0.5;
YOffset = obj_Player.sprite_height * -0.5;

// take direction input
if (VerticalFacing == Direction.Up)
{
	XOffset = 0;
	YOffset *= 2;
	image_angle = 90;
}
else if (VerticalFacing == Direction.Down)
{
	XOffset = 0;
	YOffset = 0;
	image_angle = 270;
}
else if (VerticalFacing == Direction.Neutral)
{
	if (IsFacingRight)
	{
		// default is right
	}	
	else // Left
	{
		//XOffset *= -1; // was correct pre-adjusting player image direction logic
		XOffset *= 1;
		image_xscale = -1;
	}
}

// location starts in correct position (needs to be in Create and Step or will glitch for first frame)
if (instance_exists(obj_Player))
{
	x = obj_Player.x + XOffset;
	y = obj_Player.y + YOffset;
}