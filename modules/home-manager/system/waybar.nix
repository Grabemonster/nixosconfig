{pkgs, ...}:
{
programs.waybar ={
  enable = true;
  package = pkgs.waybar;
  settings = [{
    layer = "top";
    height = 32;
    modules-left = ["wlr/taskbar" "hyprland/window"];
    modules-center = ["hyprland/workspaces"];
    modules-right = ["clock" "custom/logout"];

    "hyprland/workspaces" = {
         "all-outputs"= false;
         "format" = "{icon}";
         "on-scroll-up" = "hyprctl dispatch workspace e+1";
         "on-scroll-down" = "hyprctl dispatch workspace e-1";
         "format-icons" = {
            "1"="1";
            "2"="2";
            "3"="3";
            "4"="4";
            "5"="5";
            "6"="6";
            "7"="7";
            "8"="8";
            "9"="9";
            "10"="10";
            "11"="1";
            "12"="2";
            "13"="3";
            "14"="4";
            "15"="5";
            "16"="6";
            "17"="7";
            "18"="8";
            "19"="9";
            "20"="10";
         };
    };

      "wlr/taskbar" = {
        "format" = "{icon}";
        "on-click" = "activate";
        all-outputs = true;
        "tooltip-format" = "{app_id}";
        "icon-size" = 10;
        "ignore-list" = [

        ];
      };

    "hyprland/window" = {
        format = "{title}";
        rewrite = {
          # regex = new name
          "(.*)Mozilla Firefox" = "Firefox";
        };
      };

    "clock" = {
        "timezone" = "Europe/Berlin";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format" = "{:%A %H:%M}";
        "calendar" = {
            "format" = {
                "today" = "<span color='#000099'><b><u>{}</u></b></span>";
            };
        };
    };
    
      "custom/logout" = {
        exec = "echo -e '\\uf011'";
        on-click = "wlogout -b 2";
        tooltip-format = "opens wlogout";
      };
  }];
};
home.file.".config/waybar/style.css".source = ./styleshets/hyprbar.css;
}
