{pkgs, ...}:
{
wayland.windowManager.hyprland.settings = {
  decoration = {
        "rounding" = "5";


        "drop_shadow" = "true";
        "shadow_range" = "4";
        "shadow_render_power" = "3";
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";

          "vibrancy" = "0.1696";
        };
    };

    windowrulev2 = [
      "opacity 0.85, class:gnome"
      "suppressevent maximize, class:.*"
    ];
  };
}
