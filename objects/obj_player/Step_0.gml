/// @description Player movement

// Check keys for movement
if (global.player_control)
{
    move_right = keyboard_check(vk_right);
    move_left = keyboard_check(vk_left);
    move_up = keyboard_check(vk_up);
    move_down = keyboard_check(vk_down);
}
else 
{
    move_right = 0;
    move_left = 0;
    move_up = 0;
    move_down = 0;
}

// Calculate movement
v_x = (move_right - move_left) * walk_speed;
v_y = (move_down - move_up) * walk_speed;

// If idle
if (v_x == 0 && v_y == 0)
{
    // If I'm not picking up or putting down an item
    if (my_state != player_state.picking_up && my_state != player_state.putting_down)
    {
        // If I don't have an item
        if (has_item == noone)
        {
            my_state = player_state.idle;
        }
        // If I'm carrying an item
        else
        {
            my_state = player_state.carry_idle;
        }
    }
}

// If moving
if (v_x != 0 || v_y != 0)
{
    if !collision_point(x + v_x, y, obj_par_environment, true, true)
    {
        x += v_x;
    }

    if !collision_point(x, y + v_y, obj_par_environment, true, true)
    {
        y += v_y;
    }

    // Change direction based on movement
    if (v_x > 0)
    {
        dir = 0;
    }
    if (v_x < 0)
    {
        dir = 2;
    }
    if (v_y > 0)
    {
        dir = 3;
    }
    if (v_y < 0)
    {
        dir = 1;
    }

    // Set state
    // If we don't have an item
    if (has_item == noone)
    {
        my_state = player_state.walking;
    }
    // If we're carrying an item
    else
    {
        my_state = player_state.carrying;
    }

    // Move audio listener with me
    audio_listener_set_position(0, x, y, 0);
}

// Check for collision with NPCs
nearby_npc = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_par_npc, false, true);
if (nearby_npc)
{
    // Play greeting sound
    if (!has_greeted)
    {
        audio_play_sound(snd_greeting01, 1, false);
        has_greeted = true;
    }
    // Pop up prompt
    if (npc_prompt == noone || npc_prompt == undefined)
    {
        npc_prompt = scr_show_prompt(nearby_npc, nearby_npc.x, nearby_npc.y - 450);
    }
    //show_debug_message("obj_player has found an NPC!");
}
else
{
    has_greeted = false;

    // Get rid of prompt
    scr_dismiss_prompt(npc_prompt, 0);
    //show_debug_message("obj_player hasn't found anything");
}

// Check for collision with Items
nearby_item = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_par_item, false, true);
if (nearby_item && !nearby_npc)
{
    // Pop up prompt
    if (item_prompt == noone || item_prompt == undefined)
    {
        //show_debug_message("obj_player has found an item!");
        item_prompt = scr_show_prompt(nearby_item, nearby_item.x, nearby_item.y - 300);
    }
}
else
{
    // Get rid of prompt
    scr_dismiss_prompt(item_prompt, 1);
}

// If picking up an item
if (my_state == player_state.picking_up)
{
    // At the end of animation
    if (image_index >= image_number - 1)
    {
        my_state = player_state.carrying;
        global.player_control = true;
    }
}

// If put down an item
if (my_state == player_state.putting_down)
{
    // Reset weight
    carry_limit = 0;
    // Reset my state once animation finishes
    if (image_index >= image_number - 1)
    {
        my_state = player_state.idle;
        global.player_control = true;
    }
}

// Depth sorting
depth = -y;

// Auto-choose sprite based on state and direction
sprite_index = player_spr[my_state][dir];