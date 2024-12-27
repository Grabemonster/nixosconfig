{user,system, ghostty, config, pkgs, ... }:
{
    imports = 
        [
            ./system/hyprland.nix
            ./system/rebuild.nix
            ./system/waybar.nix
            ./system/wlogout.nix
            ./system/swaylock.nix
            ./system/wofi.nix
            ./system/clipboard.nix
            ./system/swaync.nix
            ./system/playerctl.nix

            ./terminal/nvim/nixvim.nix
            ./terminal/git.nix
            ./terminal/bash.nix
            ./terminal/tmux.nix
            ./terminal/yazi.nix
            ./terminal/fastfetch.nix

            ./apps/webbrowser.nix
            ./apps/E-mail.nix
            ./apps/obs.nix
        ];
# Home Manager needs a bit of information about you and the paths it should
# manage.
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";


    home.packages = with pkgs; [
        prismlauncher
        webcord
        hyprpolkitagent
        hyprpicker
        playerctl 
        numlockx
        spotify
        pavucontrol
        heroic
        lutris
        gparted 
        unzip
        onedrive
        ghostty.packages."${system}".default
        godot_4
    ];

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
