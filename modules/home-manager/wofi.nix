{pkgs, ...}:
{
  programs.wofi = 
  let
    style = builtins.readFile "${toString ./styleshets/wofi.css}";
  in 
  {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      width = "60%";
      height = "30%";
    };
    style = style;
  };

  home.file.".config/scripts/wofi-launcher.sh".text = ''
    #!${pkgs.bash}/bin/bash

    QUERY=$(wofi --dmenu --prompt "Eingabe")

    if [[ -z "$QUERY" ]] then 
      exit 0
    fi
  '';
}
