{pkgs, ...}:
let

default = "~/wallpaper/wallpaper.jpg";

in
{
services.hyprpaper = {
  enable = true;
  
  settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;


    preload = [
      "${default}"
    ];
    
    wallpaper = [
      ",${default}"
    ];
  };
  };

  home.file.".config/scripts/randomimage.sh".text = ''
    #!${pkgs.bash}/bin/bash
    ${pkgs.psmisc}/bin/killall .waybar-wrapped
    directory=~/wallpaper
    monitor=hyprctl monitors | grep Monitor | awk '{print $2}'

    if [ -d "$directory" ]; then
      random_background=$(ls $directory/*.jpg | shuf -n 1)
      cp $random_background ~/.cache/activwalpaper.jpg
      wallust run $random_background --ignore-sequence="background,foreground,color0,color1,color2,color3,color4,color5,color6,color7,color8,color9,color10,color11,color12,color13,color14,color15"

      sleep 1
      hyprctl hyprpaper unload all
      hyprctl hyprpaper preload $random_background
      hyprctl hyprpaper wallpaper "$monitor, $random_background"

      waybar &
    fi
  '';

  home.file.".config/wallust/wallust.toml".text = ''
backend = "resized"
color_space = "lab"
palette = "dark"
check_constrast = true


[templates]
css_template = {template = 'css_template.css', target = '~/.cache/wallust/css_template.css'}
rasi_template = {template = 'rasi_template.rasi', target = '~/.cache/wallust/rasi_template.rasi'}
  '';

  home.file.".config/wallust/templates/css_template.css".text = ''  
@define-color background {{background}};
@define-color foreground {{foreground}};
@define-color cursor {{cursor}};
@define-color color0 {{color0}}; 
@define-color color1 {{color1}};
@define-color color2 {{color2}};
@define-color color3 {{color3}};
@define-color color4 {{color4}};
@define-color color5 {{color5}};
@define-color color6 {{color6}};
@define-color color7 {{color7}};
@define-color color8 {{color8}};
@define-color color9 {{color9}};
@define-color color10 {{color10}}; 
@define-color color11 {{color11}};
@define-color color12 {{color12}};
@define-color color13 {{color13}};
@define-color color14 {{color13}};
@define-color color15 {{color15}};
  '';

  home.file.".config/wallust/templates/rasi_template.rasi".text = '' 
  *{
background: {{background}};
foreground: {{foreground}};
cursor: {{cursor}};
color0: {{color0}}; 
color1: {{color1}};
color2: {{color2}};
color3: {{color3}};
color4: {{color4}};
color5: {{color5}};
color6: {{color6}};
color7: {{color7}};
color8: {{color8}};
color9: {{color9}};
color10: {{color10}}; 
color11: {{color11}};
color12: {{color12}};
color13: {{color13}};
color14: {{color13}};
color15: {{color15}};
  }
  '';
}
