{pkgs, ...}:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        plugins = [pkgs.rofi-calc pkgs.rofi-emoji];
        extraConfig = {
            modi = "drun,calc,emoji,combi";
            kb-primary-paste = "Control+V,Shift+Insert";
            kb-secondary-paste = "Control+v,Insert";
        };
    };
}
