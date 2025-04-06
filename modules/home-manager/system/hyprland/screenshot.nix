{pkgs,...}:
{
    home.file.".config/scripts/screenshot.sh".text = ''
    #!${pkgs.bash}/bin/bash

        ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" ~/Pictures/screenshot-$(date +"%Y-%m-%d_%H-%M-%S-%3N").png
    

    '';
}
