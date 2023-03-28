/// @description Game variables

// Game variables
global.player_control = true;

enum fade_state {
    fading_in,
    fade_in_done,
    fading_out,
    fade_out_done,
}

// Player States
enum player_state {
    idle,
    walking,
    picking_up,
    carrying,
    carry_idle,
    putting_down
}