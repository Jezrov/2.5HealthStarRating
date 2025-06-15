
event_inherited();

room_goto(Room1);

if (obj_PlayerManager)
{
	instance_destroy(obj_PlayerManager);
}
instance_create_layer(x, y, "Instances", obj_PlayerManager);