/// @description Animation and more

// Change appearance with state
switch my_state
{
    case npc_state.normal:
    {
        // Random loop timing
        if (image_speed > 0) {
            if (image_index == image_number - 1) {
                // Stop animating.
                image_speed = 0;
                // Set new alarm to fire at certain time in range.
                alarm[0] = irandom_range(loop_range_01, loop_range_02);
            }
        }
    };
    break;

    case npc_state.done:
    {
        if (done_sprite != noone && sprite_index != done_sprite)
        {
            sprite_index = done_sprite;
        }
    };
    break;
}

// Depth sorting
depth = -y;