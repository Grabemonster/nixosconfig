{pkgs, ...}:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi.override { plugins = [ pkgs.rofi-calc];};
    };
}
