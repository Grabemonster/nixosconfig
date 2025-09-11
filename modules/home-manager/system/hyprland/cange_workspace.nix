{pkgs, ...}:
{
    home.file.".config/scripts/workspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(hyprctl activeworkspace | awk '{print $3}' | xargs | awk '{ print substr( $0, 1, length($0)-1 ) }')       
        hyprctl dispatch workspace $firstnumber$1
    '';

    home.file.".config/scripts/movetoworkspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(hyprctl activeworkspace | awk '{print $3}' | xargs | awk '{ print substr( $0, 1, length($0)-1 ) }')
        hyprctl dispatch movetoworkspace $firstnumber$1
    '';
}
