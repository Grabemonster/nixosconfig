{...}:
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
}
