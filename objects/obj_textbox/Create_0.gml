/// @description Variables and setup

// Textbox variables
textToShow = "Put whatever text you like in this dialog!";
textWidth = 450;
lineHeight = 28;
fade_me = fade_state.fading_in;
fadeSpeed = 0.1;
image_alpha = 0;

global.player_control = false;

// Play UI sound
audio_play_sound(snd_pop01, 1, false);

// Dismiss any visible prompts
scr_dismiss_prompt(obj_prompt, 0);