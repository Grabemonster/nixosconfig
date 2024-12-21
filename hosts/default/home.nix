{user, config, pkgs, ... }:

{
  imports = 
  [
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/wofi.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/lf.nix
      ../../modules/home-manager/waybar.nix
      ../../modules/home-manager/wlogout.nix
      ../../modules/home-manager/swaylock.nix
      ../../modules/home-manager/nixvim.nix
      ../../modules/home-manager/neovim.nix
      ../../modules/home-manager/rebuild.nix
      ../../modules/home-manager/bash.nix
      ../../modules/home-manager/yazi.nix
      ../../modules/home-manager/tmux.nix 
      ../../modules/home-manager/webbrowser.nix
      ../../modules/home-manager/fastfetch.nix
      ../../modules/home-manager/clipboard.nix
    ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  dconf.settings = {
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
  };

  gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
  };



  fonts.fontconfig.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
