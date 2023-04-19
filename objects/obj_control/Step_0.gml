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

        // Check if npcs are done
        if (!global.game_over)
        {
            if (instance_exists(obj_npc_baker) && instance_exists(obj_npc_teacher) && instance_exists(obj_npc_grocer))
            {
                if (obj_npc_baker.my_state == npc_state.done && obj_npc_teacher.my_state == npc_state.done && obj_npc_grocer.my_state == npc_state.done)
                {
                    // Queue up game over sequence
                    global.player_control = false;
                    alarm[0] = 60;
                    // Mark game as won
                    global.game_over = true;
                }
            }
        }
    };
    break;
}