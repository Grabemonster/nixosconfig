{pkgs, lib, ... }:

{
  imports = [
    ./hyprland/bindings.nix
    ./hyprland/input-device.nix
    ./hyprland/general.nix
    ./hyprland/decoration.nix
    ./hyprland/animations.nix
    ./hyprland/wallpaper.nix
    #./hyprland/hyprlock.nix
    ./hyprland/hypridle.nix
    ./hyprland/cange_workspace.nix
    ./hyprland/swaylock.nix
    ./hyprland/screenshot.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings =
        let
        # Monitor-Namen
        monitor1 = "DP-2"; # Ersetzen Sie dies durch den tatsächlichen Namen Ihres ersten Monitors
        monitor2 = "HDMI-A-3"; # Ersetzen Sie dies durch den tatsächlichen Namen Ihres zweiten Monitors
    in
    {
      monitor = [
      "${monitor1}, 2560x1440@143,0x0,1"
      "${monitor2}, 1280x720@50,-1280x720,1"
      ];

      
      workspace = map (ws: "${toString ws},monitor:${monitor1}") [11 12 13 14 15 16 17 18 19 20]
        ++ map (ws: "${toString ws},monitor:${monitor2}") [1 2 3 4 5 6 7 8 9 10];


      "exec-once" = [
        "bash ~/.config/scripts/randomimage.sh"
        "bash ~/.config/scripts/lockscreentime.sh"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "xrandr --output DP-2 --primary"
        "onedrive --monitor --single-directory Dokumente --single-directory Schule --single-directory minecraft"
      ]; 

      dwindle = {
        "pseudotile" = "true";
        "preserve_split" = "true";
      };

      master = {
        "new_status" = "master";
      };

      };
  };
}

  
