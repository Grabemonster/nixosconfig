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
      allow_images = true;
      width = "60%";
      height = "30%";
    };
    inherit style;
  }; 
}
