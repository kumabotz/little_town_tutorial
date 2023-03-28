/// @description My first code

// Variables
walk_speed = 16;
v_x = 0;
v_y = 0;
dir = 3;
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;
nearby_NPC = noone;
look_range = 30;
has_greeted = false;
npc_prompt = noone;
has_item = noone;
has_item_x = x;
has_item_y = y;
nearby_item = noone;
item_prompt = noone;
carry_limit = 0;
my_state = player_state.idle;

// Create listener and set orientation
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);