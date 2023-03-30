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

// Player sprite array [my_state][dir]
// 0 => right
// 1 => up
// 2 => left
// 3 => down

// Idle
player_spr[player_state.idle][0] = spr_player_idle_right;
player_spr[player_state.idle][1] = spr_player_idle_up;
player_spr[player_state.idle][2] = spr_player_idle_left;
player_spr[player_state.idle][3] = spr_player_idle_down;

// Walking
player_spr[player_state.walking][0] = spr_player_walk_right;
player_spr[player_state.walking][1] = spr_player_walk_up;
player_spr[player_state.walking][2] = spr_player_walk_left;
player_spr[player_state.walking][3] = spr_player_walk_down;