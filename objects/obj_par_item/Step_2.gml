/// @description Sorting and other

// Depth, animation
switch my_state
{
    // If item is sitting on the ground
    case item_state.idle:
    {
        depth = -y;
    };
    break;

    // If item has been taken
    case item_state.taken:
    {
        // Keep track of player position
        var _result = scr_item_position();
        x = _result[0];
        y = _result[1];
        depth = _result[2];
    };
    break;

    // If item has been put back
    case item_state.putting_back:
    {
        y = put_down_y;
        my_state = item_state.idle;
    };
    break;
}