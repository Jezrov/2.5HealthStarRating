
if (instance_exists(obj_Player))
{
	TargetX = obj_Player.x;
	TargetY = obj_Player.y;
}
Speed = 5; // Example speed
var Dir = point_direction(x, y, TargetX, TargetY);
XSpeed = lengthdir_x(Speed, Dir);
YSpeed = lengthdir_y(Speed, Dir);