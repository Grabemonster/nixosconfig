{pkgs, lib, ... }:

{
  imports = [
    ./hyprland/bindings.nix
    ./hyprland/input-device.nix
    ./hyprland/general.nix
    ./hyprland/decoration.nix
    ./hyprland/animations.nix
    ./hyprland/wallpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    extraConfig = ''
    wsbind=1,DP-2
    wsbind=2,DP-2
    wsbind=3,DP-2
    wsbind=4,DP-2
    wsbind=5,DP-2
    wsbind=6,DP-2
    wsbind=7,DP-2
    wsbind=8,DP-2
    wsbind=9,DP-2
    wsbind=10,DP-2
  '';
    
    settings = {
      monitor = [
      "DP-2, 2560x1440@165,0x0,1"
      "HDMI-A-3, 1920x1080@60,-1920x540,1"
      ];

      workspace="DP-2,1";

      "exec-once" = [
        "bash ~/.config/scripts/randomimage.sh"
        "bash ~/.config/scripts/lockscreentime.sh"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
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

  
