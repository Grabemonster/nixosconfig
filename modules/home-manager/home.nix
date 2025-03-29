{user, pkgs, ... }:
{
    imports = 
        [
            ./system/hyprland.nix
            ./system/rebuild.nix
            ./system/waybar.nix
            ./system/wlogout.nix
            ./system/wofi.nix
            ./system/rofi.nix
            ./system/clipboard.nix
            ./system/playerctl.nix

            ./terminal/nvim/nixvim.nix
            ./terminal/git.nix
            ./terminal/bash.nix
            ./terminal/tmux.nix
            ./terminal/yazi.nix
            ./terminal/fastfetch.nix
            ./terminal/ghostty.nix
            ./terminal/zsh.nix

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
        godot_4
        wlr-randr
        gimp
        grim
        slurp
        arduino-ide
        python3
        python312Packages.pyserial
        plantuml
        kdePackages.kdenlive
        wallust
        wl-clipboard
        fzf
        libreoffice-qt
        hunspell
        hunspellDicts.de_DE
        hunspellDicts.en_US
        wireplumber
        psmisc
        htop
        weylus
    ];

    home.sessionVariables = {
        _JAVA_AWT_WM_NONREPARENTING = "1";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # Falls du eine NVIDIA-GPU hast
        WLR_NO_HARDWARE_CURSORS = "1"; # Falls du NVIDIA benutzt 
        _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1 -Dawt.useSystemAAFontSettings=on";
    };

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
