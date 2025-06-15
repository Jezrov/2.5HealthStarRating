
// Owner is already initialized by the struct passed in creation
if (!instance_exists(Owner)) 
{
    Owner = noone;
}
else
{
	Owner = obj_Player;	
}