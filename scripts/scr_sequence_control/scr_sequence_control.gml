// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_sequence(_seq_to_play)
{
    if (_seq_to_play != noone)
    {
        // Make sure our sequence doesn't already exist
        if (instance_exists(obj_control) && !layer_sequence_exists(obj_control.cur_seq_layer, _seq_to_play))
        {
            if (layer_exists(obj_control.cur_seq_layer))
            {
                // Set sequence to centre of Camera view
                var _cam_x = scr_get_cam_x();
                var _cam_y = scr_get_cam_y();

                // Create (play) the sequence
                layer_sequence_create(obj_control.cur_seq_layer, _cam_x, _cam_y, _seq_to_play);
                
                // Make sure Cutscenes layer is above the action
                layer_depth(obj_control.cur_seq_layer, -10000);
            }
        }
    }
}