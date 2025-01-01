{pkgs, ...}:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi.override { plugins = [ pkgs.rofi-calc];};
        extraConfig = {
            modi = "drun,calc,combi";
            kb-primary-paste = "Control+V,Shift+Insert";
            kb-secondary-paste = "Control+v,Insert";
        };
    };
}
