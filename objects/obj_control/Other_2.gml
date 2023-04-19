/// @description Game variables

// Game variables
global.player_control = true;
global.game_over = false;

enum fade_state
{
    fading_in,
    fade_in_done,
    fading_out,
    fade_out_done,
}

// Player States
enum player_state
{
    idle,
    walking,
    picking_up,
    carrying,
    carry_idle,
    putting_down
}

// Item States
enum item_state
{
    idle,
    taken,
    used,
    putting_back
}

// Sequence States
enum seq_state
{
    not_playing,
    waiting,
    playing,
    finished
}

// Sequence variables
sequence_state = seq_state.not_playing;
cur_seq_layer = noone;
cur_seq = noone;

// npc states
enum npc_state
{
    normal,
    done
}