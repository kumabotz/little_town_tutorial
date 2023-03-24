/// @description Effeccts and animation

// Fade effects
switch fade_me {
    case "fadeIn": {
        if (image_alpha < 1) {
            image_alpha += fade_speed;
        } else {
            fade_me = "fadeVisible";
        }
    }; break;

    case "fadeOut": {
        if (image_alpha > 0) {
            image_alpha -= fade_speed;
        } else {
            fade_me = "fadeDone";
            // Queue up destroy
            alarm[0] = 2;
        }
    }; break;
}
