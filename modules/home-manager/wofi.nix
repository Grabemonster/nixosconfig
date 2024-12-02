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

    # Prüfe auf Präfixe
    if [[ "$QUERY" == "="* ]]; then
      # Mathe-Modus
      INPUT=${QUERY:1}  # Entfernt das '='
      RESULT=$(echo "$INPUT" | bc -l 2>/dev/null)
      if [[ $? -ne 0 ]]; then
        wofi --dmenu --prompt "$QUERY"        
      else
        notify-send "Ergebnis" "$INPUT = $RESULT"
      fi

    elif [[ "$QUERY" == "http://"* || "$QUERY" == "https://"* ]]; then
      # URL-Modus
      xdg-open "$QUERY" &

    else
    # Versuche, ob es ein Programm oder ein Suchbegriff ist
    if command -v "$QUERY" &>/dev/null; then
        # Programm starten
        "$QUERY" &
     else
        # Websuche durchführen
        xdg-open "https://www.google.com/search?q=$QUERY" &
      fi
    fi
  '';
}
