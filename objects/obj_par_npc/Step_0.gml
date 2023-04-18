/// @description Animation and more
// Random loop timing
animating = (image_speed > 0);
atLastFrame = (image_index == image_number - 1);
if (animating) {
    if (atLastFrame) {
        // Stop animating.
        image_speed = 0;
        // Set new alarm to fire at certain time in range.
        alarm[0] = irandom_range(loop_range_01, loop_range_02);
    }
}

// Depth sorting
depth = -y;