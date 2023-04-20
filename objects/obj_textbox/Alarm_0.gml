/// @description Destroy me and do things

// Return control to player if no sequence to load
if (sequence_to_show == noone)
{
    global.player_control = true;
}
else
{
    // Play npc sequence
    scr_play_sequence(sequence_to_show);
}

// Destroy me
instance_destroy();