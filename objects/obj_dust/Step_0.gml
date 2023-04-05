/// @description Animation

// Rotate cloud
image_angle += rot_speed;
y -= drift_speed;

// Fade out
if (image_alpha > 0)
{
    image_alpha -= fade_speed;
}
else
{
    instance_destroy();
}