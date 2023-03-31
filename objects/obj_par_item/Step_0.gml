/// @description Sorting and other

// Depth, animation
switch my_state {
    // If item is sitting on the ground
    case item_state.idle: {
        depth = -y;
    }; break;
}