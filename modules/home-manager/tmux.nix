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
                    set -g @vim-tmux-navigator_mapping_left "C-Left C-h"
                    set -g @vim-tmux-navigator_mapping_right "C-Right C-l"
                    set -g @vim-tmux-navigator_mapping_up "C-Up C-k"
                    set -g @vim-tmux-navigator_mapping_down "C-Down C-j"
                    set -g @vim-tmux-navigator_mapping_prev "C-p" 
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
