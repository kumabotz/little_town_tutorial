/// @description Animation and effects

// Fade effects
switch fadeMe {
	// Fade in
	case FadeState.FadingIn: {
		if (image_alpha < 1) {
			image_alpha += fadeSpeed;
		} 
		else {
			fadeMe = FadeState.FadedIn;
		}
	}; break;
	
	// 1: faded in
	
	// Fade out
	case FadeState.FadingOut: {
		if (image_alpha > 0) {
			image_alpha -= fadeSpeed;
		} 
		else {
			fadeMe = FadeState.FadedOut;
			// Queue up destroy
			alarm[0] = 2;
		}
	}; break;
	
	// 3: faded out
}