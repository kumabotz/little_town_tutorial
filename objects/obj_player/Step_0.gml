/// @description Player movement

// Check keys for movement
if (global.playerControl) {
	move_right = keyboard_check(vk_right);
	move_left = keyboard_check(vk_left);
	move_up = keyboard_check(vk_up);
	move_down = keyboard_check(vk_down);
}
else {
	move_right = 0;
	move_left = 0;
	move_up = 0;
	move_down = 0;
}

// Calculate movement
v_x = (move_right - move_left) * walk_speed;
v_y = (move_down - move_up) * walk_speed;

// If idle
if (v_x == 0 && v_y == 0) {
	// Change idle Sprite based on direction
	switch dir {
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
	}
}

// If moving
if (v_x != 0 || v_y != 0) {
	if !collision_point(x + v_x, y, obj_par_environment, true, true) {
		x += v_x;	
	}
	
	if !collision_point(x, y + v_y, obj_par_environment, true, true) {
		y += v_y;
	}
	
	
	// Change walking Sprite based on direction
	if (v_x > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	if (v_x < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	if (v_y > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	if (v_y < 0) {
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
	
	// Move audio listener with me
	audio_listener_set_position(0, x, y, 0);
}

// Check for collision with NPCs
nearby_NPC = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_par_npc, false, true);
if (nearby_NPC) {
    // Play greeting sound
    if (!has_greeted) {
        audio_play_sound(snd_greeting01, 1, false);
        has_greeted = true;
    }
    // Pop up prompt
    if (npc_prompt == noone || npc_prompt == undefined) {
        npc_prompt = scr_show_prompt(nearby_NPC, nearby_NPC.x, nearby_NPC.y - 450);
    }

    //show_debug_message("obj_player has found an NPC!");
}
else {
    has_greeted = false;
    //show_debug_message("obj_player hasn't found anything");
}

// Depth sorting
depth = -y;