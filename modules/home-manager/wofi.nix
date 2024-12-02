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

if [[ -z "$QUERY" ]]; then
  exit 0
fi

# Check if the query starts with '='
if [[ "$QUERY" == =* ]]; then
  # Math mode
    echo "$QUERY"
  INPUT="${QUERY:1}"  # Remove the '='
  RESULT=$(echo "$INPUT" | bc -l 2>/dev/null)
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
