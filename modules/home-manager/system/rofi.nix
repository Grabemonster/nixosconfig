{pkgs, config, ...}:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        plugins = [pkgs.rofi-calc pkgs.rofi-emoji];
        extraConfig = {
            modi = "drun,calc,emoji";
            kb-primary-paste = "Control+V,Shift+Insert";
            kb-secondary-paste = "Control+v,Insert";
        };
        font = "JETBRAINS MONO";
        theme = let
# Use `mkLiteral` for string-like values that should show without
# quotes, e.g.:
# {
#   foo = "abc"; => foo: "abc";
#   bar = mkLiteral "abc"; => bar: abc;
# };
            inherit (config.lib.formats.rasi) mkLiteral;
        in {
            "*" = {
                background-color = mkLiteral "rgba ( 0, 0, 0, 20%)";
                border-color = mkLiteral "#FFFFFF";
                width = 512;
            };

            "#inputbar" = {
                children = map mkLiteral [ "prompt" "entry" ];
            };

            "#textbox-prompt-colon" = {
                expand = false;
                str = ":";
                margin = mkLiteral "0px 0.3em 0em 0em";
                color = mkLiteral "@foreground-color";
            };
        };
    };
}
