{pkgs, ...}:
{
    programs.ghostty = {
        enable = true;
        clearDefaultKeybinds = true;
        settings = {
            background = "000000";
            foreground = "ffffff";
            font-family = "";
            background-opacity = 0.8;
            window-decoration = false;
        };
    };
}
