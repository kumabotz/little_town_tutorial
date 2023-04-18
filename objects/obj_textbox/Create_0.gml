/// @description Variables and setup

// Textbox variables
text_to_show = "Put whatever text you like in this dialog!";
text_width = 450;
line_height = 28;
fade_me = fade_state.fading_in;
fade_speed = 0.1;
image_alpha = 0;
sequence_to_show = noone;

global.player_control = false;

// Play UI sound
audio_play_sound(snd_pop01, 1, false);

// Dismiss any visible prompts
scr_dismiss_prompt(obj_prompt, 0);