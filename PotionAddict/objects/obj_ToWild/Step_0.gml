// bounding box size

if (place_meeting(x, y, obj_Player))
{
     switch (obj_PlayerManager.NextRoom)
    {
        case Rooms.Room2:
            room_goto(Room2);
            obj_PlayerManager.NextRoom = Rooms.Room3;
            break;

        case Rooms.Room3:
            room_goto(Room3);
            obj_PlayerManager.NextRoom = Rooms.Room4;
            break;

        case Rooms.Room4:
            room_goto(Room4);
            obj_PlayerManager.NextRoom = Rooms.Room5;
            break;

        case Rooms.Room5:
            room_goto(Room5);
            break;
	}
}

