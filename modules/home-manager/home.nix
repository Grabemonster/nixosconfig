{user, config, pkgs, inputs, lib, ... }:
{
    imports = 
        [
            inputs.my-nvim.homeManagerModules.my-nvim
            ./system/hyprland.nix
            ./system/rebuild.nix
            ./system/waybar.nix
            ./system/wlogout.nix
            ./system/wofi.nix
            ./system/rofi.nix
            ./system/clipboard.nix
            ./system/playerctl.nix

            #./terminal/nvim/nixvim.nix
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
            ./apps/onedrive.nix
        ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";


    home.packages = with pkgs; [
        kdePackages.dolphin
        rclone
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
        godot_4
        wlr-randr
        gimp3
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
        btop
        weylus
        vlc
        devenv
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        papirus-folders
    ];
    programs.my-nvim = {
        enable=true;
        vimAlias = true;
        setEditor = true;
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            gtk-theme = "Adwaita-dark";
            color-scheme = "prefer-dark";
        };
    };

    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark";       # <-- hier Adwaita-dark setzen
            package = pkgs.gnome-themes-extra;
        };
        iconTheme = {
            name = "Adwaita";            # <-- passende Adwaita Icons
            package = pkgs.adwaita-icon-theme;
        };
        cursorTheme = {
            name = "Adwaita";            # <-- Standard-Cursor
            package = pkgs.adwaita-icon-theme;
        };
        gtk3 = {
            extraConfig.gtk-application-prefer-dark-theme = true;
        };
    };

    
    
    qt = {
  enable = true;
  platformTheme = "qtct";   # für qt5ct/qt6ct
  style = {
    name = "Breeze-Dark";
    package = pkgs.libsForQt5.breeze-qt5;
  };
};



    xdg.userDirs.enable = true; 
    xdg.userDirs.createDirectories = true;
    xdg.userDirs.extraConfig = {
        XDG_DESKTOP_DIR="${config.home.homeDirectory}/Desktop";
        XDG_DOWNLOAD_DIR="${config.home.homeDirectory}/Downloads";
        XDG_TEMPLATES_DIR="${config.home.homeDirectory}/Templates";
        XDG_PUBLICSHARE_DIR="${config.home.homeDirectory}/";
        XDG_DOCUMENTS_DIR="${config.home.homeDirectory}/Documents";
        XDG_MUSIC_DIR="${config.home.homeDirectory}/Music";
        XDG_PICTURES_DIR="${config.home.homeDirectory}/Pictures";
        XDG_VIDEOS_DIR="${config.home.homeDirectory}/Videos";
    };

    home.sessionVariables = {
        __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # Falls du eine NVIDIA-GPU hast
        WLR_NO_HARDWARE_CURSORS = "1"; # Falls du NVIDIA benutzt 
    };

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

    fonts.fontconfig.enable = true;
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
