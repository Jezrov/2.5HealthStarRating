
event_inherited();

if (instance_exists(obj_PlayerManager))
{
    instance_destroy(obj_PlayerManager); // destroy old data if any
}

var pm = instance_create_layer(x, y, "Instances", obj_PlayerManager);
pm.persistent = true; // mark as persistent BEFORE room change

room_goto(Room1);