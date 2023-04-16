/// @description Test Sequence

// Set sequence to centre of camera view
var _cam_x = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
var _cam_y = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);

// Create sequence on the proper layer
if !(layer_sequence_exists(cur_seq_layer, seq_baker_happy))
{
    if (layer_exists(cur_seq_layer))
    {
        layer_sequence_create(cur_seq_layer, _cam_x, _cam_y, seq_baker_happy);
        // Make sure Cutscenes layer is above the action
        layer_depth(cur_seq_layer, -10000);
    }
}
