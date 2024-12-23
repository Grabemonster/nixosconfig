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
    
    settings = {

      monitor = ",preferred,auto,1";

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
  };
}

  
