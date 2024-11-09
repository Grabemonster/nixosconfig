{... }:
{
programs.lf = {
  enable = true;

  settings = {
    preview = true;
    drawbox = true;
    icons = true;
    ignorecase = true;
  };

  commands = {
    editor-open = ''$nvim $f'';
    touch = ''
    ''${{
    printf "File Name: "
    read FILE
    touch $FILE
    }}
    '';
    mkdir = ''
    ''${{
      printf "Directory Name: "
      read DIR
      mkdir -p "$DIR"	        
    }}
    '';
    delete = ''$mv $f ~/Recycle-Bin/'';
  };

  keybindings = {
    
    "\\\"" = "";
    o = "";
    c = "touch";
    "." = "set hidden!";
    "´" = "mark-load";
    "\\'" = "mark-load";
      "<enter>" = "open";
      x = "cut";
      v = ":paste; clear";

    e = "editor-open";

  };

};

}
