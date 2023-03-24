// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_show_prompt(_object, _x, _y){
    if (instance_exists(_object)) {
        if (!instance_exists(obj_textbox) && !instance_exists(obj_prompt)) {
            iii = instance_create_depth(_x, _y, -10000, obj_prompt);
            return iii;
        }
    }
}

function scr_dismiss_prompt(_which_prompt, _to_reset) {
    if (_which_prompt != undefined && instance_exists(_which_prompt)) {
        // Tell prompt object to fade out
        with (_which_prompt) {
            fade_me = "fadeOut";
        }
        // Reset appropriate prompt variable
        if (instance_exists(obj_player)) {
            with (obj_player) {
                switch _to_reset {
                    // Reset npc prompt
                    case 0: npc_prompt = noone; break;
                }
            }
        }
    }
}