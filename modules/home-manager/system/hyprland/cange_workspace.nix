{pkgs, ...}:
{
    home.file.".config/scripts/workspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id' | xargs | awk '{ print substr( $0, 1, length($0)-1 ) }')       
        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "firstnumber$1"
    '';

    home.file.".config/scripts/movetoworkspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(${pkgs.hyprland}/bin/hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id' | xargs | awk '{ print substr( $0, 1, length($0)-1 ) }')
        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "firstnumber$1"
    '';
}
