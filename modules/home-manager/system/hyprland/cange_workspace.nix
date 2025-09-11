{pkgs, ...}:
{
    home.file.".config/scripts/workspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id')       
        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "firstnumber$1"
    '';

    home.file.".config/scripts/movetoworkspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id')
        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "firstnumber$1"
    '';
}
