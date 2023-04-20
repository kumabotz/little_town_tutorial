// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_cam_x()
{
    var pos = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5);
    return pos;
}

function scr_get_cam_y()
{
    var pos = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5);
    return pos;
}