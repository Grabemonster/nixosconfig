{config, pkgs, ...}:
{
  programs.wofi = 
  let
    style = builtins.readFile "${toString ./styleshets/wofi.css}";

    # Ort, an dem wir das Skript speichern werden
    calculatorScript = "${config.home.homeDirectory}/.local/bin/calculate-handler.sh";
  in 
  {
    enable = true;
    settings = {
      mode = "drun";
      parseaction = true;
      halign = "fill";
      valign = "fill";
      allow_images = true;
      width = "60%";
      height = "30%";
    };
    inherit style;
  };

  # Aktiviert Desktop-Dateien und Skripte
  home.packages = [ pkgs.libnotify ];

  # Skript erstellen
  home.file."${config.home.homeDirectory}/.local/bin/calculate-handler.sh" = {
    text = ''
      #!/usr/bin/env bash

      QUERY="$1"

      if [[ "$QUERY" == "="* ]]; then
        INPUT="${QUERY:1}"
        RESULT=$(echo "$INPUT" | ${pkgs.bc}/bin/bc -l 2>/dev/null)
        if [[ $? -ne 0 ]]; then
          notify-send "Fehler" "Ungültiger Ausdruck: $INPUT"
        else
          notify-send "Ergebnis" "$INPUT = $RESULT"
        fi
      else
        xdg-open "https://www.google.com/search?q=$QUERY"
      fi
    '';
   
  };

  # .desktop-Datei erstellen
  home.file."${config.home.homeDirectory}/.local/share/applications/calculator-handler.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Calculator
      Comment=Perform quick calculations
      Exec=${config.home.homeDirectory}/.local/bin/calculate-handler.sh %u
      Terminal=false
      Type=Application
      Categories=Utility;
    '';
  };
}
