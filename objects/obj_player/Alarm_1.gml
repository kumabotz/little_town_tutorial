/// @description Deal with objects and npc states

// Remove object
if (has_item != noone && instance_exists(has_item))
{
    // Destroy the item
    with (has_item)
    {
        instance_destroy();
    }
    // Reset my item variables
    has_itemm = noone;
    carry_limit = 0;
}

// Mark npc as done
if (nearby_npc != noone && instance_exists(nearby_npc))
{
    // Set the npc as done
    with (nearby_npc)
    {
        my_state = npc_state.done;
    }
}