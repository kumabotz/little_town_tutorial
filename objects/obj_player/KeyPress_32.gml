/// @description Textbox test

var _text;

// If player has control
if (global.player_control)
{
    // If near an NPC
    if (nearby_npc)
    {
        // If player doesn't have an item
        if (has_item == noone || has_item == undefined)
        {
            _text = nearby_npc.myText;
            if (!instance_exists(obj_textbox))
            {
                iii = instance_create_depth(nearby_npc.x, nearby_npc.y - 400, -10000, obj_textbox);
                iii.textToShow = _text;
            }
        }
    }
    else
    {
        // If near an item
        if (nearby_item)
        {
            // If player doesn't have an item
            if (has_item == noone || has_item == undefined)
            {
                global.player_control = false;
                my_state = player_state.picking_up;
                image_index = 0;
                has_item = nearby_item;

                // Take into account weight of the item we're picking up
                carry_limit = has_item.item_weight * 0.1;

                // Change state of item we're picking up
                with (has_item)
                {
                    my_state = item_state.taken;
                }

                // Play pickup sound
                audio_play_sound(snd_itemPickup, 1, false);
            }
        }
        else
        {
            if (has_item != noone)
            {
                my_state = player_state.putting_down;
                image_index = 0;
                global.player_control = false;
                // Change state of item we were carrying
                with (has_item)
                {
                    put_down_y = obj_player.y + 5;
                    my_state = item_state.putting_back;
                }
                // Play put down sound
                audio_play_sound(snd_itemPutDown, 1, false);
                // Reset item
                has_item = noone;
            }
        }
    }
}