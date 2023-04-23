/// @description Proceed to gameplay

// Press Enter to play
if (room == rm_main_title)
{
    if (!global.game_start)
    {
        audio_stop_all();
        global.game_start = true;
        room_goto(rm_game_main);
    }
}