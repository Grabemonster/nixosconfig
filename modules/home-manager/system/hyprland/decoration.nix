{pkgs, ...}:
{
wayland.windowManager.hyprland.settings = {
  decoration = {
        "rounding" = "5";
       
        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";

          "vibrancy" = "0.1696";
        };
    };

    windowrulev2 = [
      "opacity 0.9, class:gnome"
      "suppressevent maximize, class:.*"
    ];
  };
}
