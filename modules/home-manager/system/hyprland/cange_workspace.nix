{pkgs, ...}:
{
    home.file.".config/scripts/workspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(hyprctl activeworkspace | grep -Eo " [0-9]+ " | grep -Eo "[0-9]+" | grep -oP "^.*(?=.$)")       
        hyprctl dispatch workspace $firstnumber$1
    '';

    home.file.".config/scripts/movetoworkspace.sh".text = ''
        #!${pkgs.bash}/bin/bash

        firstnumber=$(hyprctl activeworkspace | grep -Eo " [0-9]+ " | grep -Eo "[0-9]+" | grep -oP "^.*(?=.$)")       
        hyprctl dispatch movetoworkspace $firstnumber$1
    '';
}
