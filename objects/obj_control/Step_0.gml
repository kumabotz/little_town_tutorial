/// @description Deal with sequences by state

// Control sequences
switch sequence_state
{
    case seq_state.playing:
    {
        global.player_control = false;
    };
    break;

    case seq_state.finished:
    {
        // Remove sequence
        if (layer_sequence_exists(cur_seq_layer, cur_seq))
        {
            layer_sequence_destroy(cur_seq);
        }
        // Restore control to player, reset
        global.player_control = true;
        sequence_state = seq_state.not_playing;
        cur_seq = noone;
    };
    break;
}