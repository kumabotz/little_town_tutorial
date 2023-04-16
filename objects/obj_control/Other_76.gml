/// @description Deal with sequences

// Listen for broadcast message
switch(event_data[? "message"])
{
    case "sequence_start":
    {
        // set our state
        sequence_state = seq_state.playing;
        // Find out which sequence just broadcast this message and mark it
        if (layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence)
        {
            cur_seq = event_data[? "element_id"];
            show_debug_message("obj_control has heard that Sequence " + string(cur_seq) + " is playing");
        }
    };
    break;

    case "sequence_end":
    {
        // set our state
        sequence_state = seq_state.finished;
        show_debug_message("obj_control has heard that Sequence " + string(cur_seq) + " has ended");
    };
    break;
}