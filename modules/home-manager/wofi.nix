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

DESKTOP_DIRS="~/nix-profile/share/applications"

# Apps extrahieren
APPS=$(find $DESKTOP_DIRS -name '*.desktop' -print 2>/dev/null | sort | while read -r FILE; do
    # Extrahiere Name und Exec aus der Desktop-Datei
    NAME=$(grep -m 1 '^Name=' "$FILE" | cut -d '=' -f 2)
    EXEC=$(grep -m 1 '^Exec=' "$FILE" | cut -d '=' -f 2 | sed 's/%.//g')  # Platzhalter entfernen
    echo -e "$NAME\x1f$EXEC"
done)

# Wähle eine App mit Wofi (Drun-ähnliche Anzeige)
QUERY=$(echo -e "$APPS" | wofi --dmenu --prompt "Wählen Sie eine Anwendung" )

# Falls eine Auswahl getroffen wurde
if [[ -n "$CHOICE" ]]; then
    CMD=$(echo "$CHOICE" | awk -F '\x1f' '{print $2}')  # Exec-Befehl extrahieren
    eval "$CMD" &  # App starten
fi
    
if [[ -z "$QUERY" ]]; then
  exit 0
fi

# Check if the query starts with '='
if [[ "$QUERY" == =* ]]; then
  # Math mode
    echo "$QUERY"
  INPUT=$(echo "$QUERY" | cut -c2-) # Remove the '='
  RESULT=$(echo "$INPUT" | ${pkgs.bc}/bin/bc -l 2>/dev/null)
  if [[ $? -ne 0 ]]; then
    echo "Ungültiger mathematischer Ausdruck: $INPUT" | wofi --dmenu --prompt "Fehler"
  else
    echo "$INPUT = $RESULT" | wofi --dmenu --prompt "Ergebnis"
  fi

elif [[ "$QUERY" =~ ^https?:// ]]; then
  # URL mode
  xdg-open "$QUERY" &

else
  # Check if it's a program or a search term
  if command -v "$QUERY" &>/dev/null; then
    # Launch program
    "$QUERY" &
  else
    # Perform a web search
    echo "Suche nach: $QUERY" | wofi --dmenu --prompt "Websuche"
    xdg-open "https://www.google.com/search?q=$(echo "$QUERY" | sed 's/ /+/g')" &
  fi
fi
  '';
}
