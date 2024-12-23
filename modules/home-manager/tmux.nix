{config, pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        package = pkgs.tmux;

        baseIndex = 1;
        clock24 = true;
        keyMode = "vi";
        mouse = true;
        prefix = "C-SPACE";
        terminal = "screen-256color";
        resizeAmount = 20;
        tmuxinator.enable = true;

        plugins = with pkgs; [
            tmuxPlugins.sensible
            {
                plugin = tmuxPlugins.vim-tmux-navigator;
                extraConfig = ''                    
                    bind-key -T C-LEFT select-pane -L
                    bind-key -T C-DOWN select-pane -D
                    bind-key -T C-UP select-pane -U
                    bind-key -T C-RIGHT select-pane -R
                    bind-key -T C-p select-pane -l
                '';
            }
        tmuxPlugins.yank
        {
            plugin = tmuxPlugins.dracula;
            extraConfig = ''
                set -g @dracula-show-powerline true
                set -g @dracula-fixed-location "Germany"
                set -g @dracula-show-flags true
                set -g @dracula-plugins "weather"
                set -g @dracula-show-fahrenheit false
                set -g @dracula-show-left-icon session
            '';
        }
        ];
        sensibleOnTop = true;

        extraConfig = ''
            set -g status-position top
        '';
    };

    home.file.".config/scripts/tmuxinatorselect".text = ''
        selection=$(tmuxinator list | sed -n '2p' | tr ' ' '\n' | grep -v '^$' | wofi --dmenu | xargs)
        if [ -n "$selection" ]; then
            gnome-terminal -- bash -c "tmuxinator start $selection; exec bash"
        else
            echo "Keine Auswahl getroffen." >&2
        fi
    '';
}
