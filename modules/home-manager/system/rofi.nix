{pkgs, config, ...}:
{
    programs.rofi = {
        enable = true;
        plugins = [pkgs.rofi-calc pkgs.rofi-emoji];
        extraConfig = {
            kb-primary-paste = "Control+V,Shift+Insert";
            kb-secondary-paste = "Control+v,Insert";
        };
        font = "JETBRAINS MONO";
        theme = ./styleshets/rofi.rasi;
        terminal = "ghostty";
    };
}
