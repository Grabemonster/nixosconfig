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
      ];

      exec = {
        "gsettings set org.gnome.desktop.interface gtk-theme" = "YOUR_DARK_GTK3_THEME";   # for GTK3 apps
        "gsettings set org.gnome.desktop.interface color-scheme" = "prefer-dark";   # for GTK4 apps
      };

      dwindle = {
        "pseudotile" = "true";
        "preserve_split" = "true";
      };

      master = {
        "new_status" = "master";
      };



      "windowrulev2" = "suppressevent maximize, class:.*";
    };
  };
}

  
