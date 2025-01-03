{pkgs, lib, ... }:

{
  imports = [
    ./hyprland/bindings.nix
    ./hyprland/input-device.nix
    ./hyprland/general.nix
    ./hyprland/decoration.nix
    ./hyprland/animations.nix
    ./hyprland/wallpaper.nix
    ./hyprland/hyprlock.nix
    ./hyprland/hypridle.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [
      "DP-2, 2560x1440@143,0x0,1"
      "HDMI-A-3, 1920x1080@60,-1920x540,1"
      ];

      

      "exec-once" = [
        "bash ~/.config/scripts/randomimage.sh"
        "bash ~/.config/scripts/lockscreentime.sh"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "xrandr --output DP-2 --primary"
        "onedrive --monitor --single-directory Dokumente --single-directory Schule"
      ]; 

      dwindle = {
        "pseudotile" = "true";
        "preserve_split" = "true";
      };

      master = {
        "new_status" = "master";
      };

      };
    plugins  = [
        pkgs.hyprlandPlugins.hyprsplit
    ];
  };
}

  
