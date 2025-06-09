Inside = false; // local variable

// Buy UI
if (obj_Player.x > bbox_left && obj_Player.x < bbox_right && 
	obj_Player.y > bbox_top && obj_Player.y < bbox_bottom)
{
	Inside = true;
	if (!instance_exists(obj_PressE))
    {
        instance_create_layer(x, y - 50, "UI", obj_PressE); // draws UI 
    }
	
	if 	(obj_Player.Coins >= Cost) // checks if Player has enough Coins Change number for cost
	{
		if keyboard_check(ord("E"))
		{
			if (ButtonPress == 0)
			{
				obj_Player.Coins -= Cost; // change cost
				obj_Player.DamagePotions += 1;
				ButtonPress = 30; // stops spamming
			}
		}
	}
}
else // destroy Press E UI
{
	Inside = false;
	if (instance_exists(obj_PressE))
	{
		instance_destroy(obj_PressE);
	}
}

if (ButtonPress > 0)
{
	ButtonPress--;
}
