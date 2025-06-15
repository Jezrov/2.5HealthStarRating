
x += XSpeed;
y += YSpeed;

if (place_meeting(x, y, obj_Player))
{
	obj_Player.Health -= Damage;
	instance_destroy();
}