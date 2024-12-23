{pkgs, ...}:
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;#
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "a";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      } 
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ./styleshets/wlogout.css;
  };
  home.file = let
      icon = ".config/wlogout/icons";
    in {
    "${icon}/lock.png".source = ./styleshets/icons/lock.png;
    "${icon}/logout.png".source = ./styleshets/icons/logout.png;
    "${icon}/shutdown.png".source = ./styleshets/icons/shutdown.png;
    "${icon}/reboot.png".source = ./styleshets/icons/reboot.png;
  };
}
