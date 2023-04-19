/// @description 

// Set sequence to centre of Camera view
var _cam_x = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
var _cam_y = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);

// Make sure our sequence doesn't already exist
if (instance_exists(obj_control) && !layer_sequence_exists(obj_control.cur_seq_layer, seq_game_over))
{
    if (layer_exists(obj_control.cur_seq_layer))
    {
        // Create (play) the sequence
        layer_sequence_create(obj_control.cur_seq_layer, _cam_x, _cam_y, seq_game_over);
        // Make sure Cutscenes layer is above the action
        layer_depth(obj_control.cur_seq_layer, -10000);
    }
}
