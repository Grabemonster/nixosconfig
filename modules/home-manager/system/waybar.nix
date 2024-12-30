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
         "format" = "{name}{icon}";
         "on-scroll-up" = "hyprctl dispatch workspace e+1";
         "on-scroll-down" = "hyprctl dispatch workspace e-1";
         "format-icons" = {
             "1" = "1";
             "11" = "1";

             "active" = "";
             "default" = "";
         };
    };

      "wlr/taskbar" = {
        "format" = "{icon}";
        "on-click" = "activate";
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
