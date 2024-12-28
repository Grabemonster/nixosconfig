{...}:
{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = true;
                grace = 5;
                hide_cursor = true;
                no_fade_in = false;
            };

            background = {
            monitor = {
                path = "~/wallpaper/anime-girl-warrior-sword.jpg";
                blur_passes = 3;
                blur_size = 8;
            };
            };

            input-field = [
            {
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(202, 211, 245)";
                inner_color = "rgb(91, 96, 120)";
                
                outline_thickness = 5;
                placeholder_text = "<span foreground='##cad3f5'>Password...</span>";
                shadow_passes = 2;
            }
            ];
        };
    };
}
