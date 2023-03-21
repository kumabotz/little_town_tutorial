/// @description Deal with music and more

// Play musicc based on Room
switch room {
	case rm_game_main: {
		//audio_play_sound(snd_townBGM, 1, true);
		audio_play_sound(snd_townAmbience, 1, true);
	}; break;
}
