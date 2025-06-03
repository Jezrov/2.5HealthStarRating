
draw_self();

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1); // debug draw Bounding Box

if (Inside) // draws Coins of Player / just for debug will remove
{
	draw_text(obj_Player.x - 5, obj_Player.y - 100, string(obj_Player.Coins));
}