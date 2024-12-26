{pkgs, ...}:
{
  home.file.".config/scripts/rebuild".text = ''
    #!${pkgs.bash}/bin/bash

    cd ~/.config/nixos/
    
    git add *

    if sudo nixos-rebuild switch --flake ~/.config/nixos#default; then 

      latest_gen=$(ls -l /nix/var/nix/profiles/system-* | grep -oE 'system-([0-9]+)' | grep -Eo '[0-9]+' | sort -n | tail -1)

      git commit -a -m "NixOS rebuild: Generation $latest_gen"

      echo ""
      echo "NixOS rebuild erfolgreich. Git commit erstellt mit Generation $latest_gen."

    else
      echo ""
      echo "NixOS rebuild fehlgeschlagen"
    fi
  '';
}
