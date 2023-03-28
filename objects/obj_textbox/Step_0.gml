/// @description Animation and effects

// Fade effects
switch fade_me {
	// Fade in
	case fade_state.fading_in: {
		if (image_alpha < 1) {
			image_alpha += fadeSpeed;
		} 
		else {
			fade_me = fade_state.fade_in_done;
		}
	}; break;
	
	// 1: faded in
	
	// Fade out
	case fade_state.fading_out: {
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;
		} 
		else {
			fade_me = fade_state.fade_out_done;
			// Queue up destroy
			alarm[0] = 2;
		}
	}; break;
	
	// 3: faded out
}