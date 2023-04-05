/// @description Deal with dust

// Create dust cloud
var _dust_x, _dust_y;
_dust_x = obj_player.x - (v_x * 4);
_dust_y = irandom_range(obj_player.y - 10, obj_player.y + 10);
if (running)
{
    // Create dust clouds only if moving
    if (v_x != 0 || v_y != 0)
    {
        instance_create_depth(_dust_x, _dust_y, depth + 2, obj_dust);
    }
    // Reset alarm
    alarm[0] = 8 + (1 + carry_limit);
}