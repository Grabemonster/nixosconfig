{config, pkgs, ...}:
{
  programs.wofi = 
  let
    style = builtins.readFile "${toString ./styleshets/wofi.css}";
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
