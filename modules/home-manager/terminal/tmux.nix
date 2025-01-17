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
            tmuxPlugins.yank 
        ];
        sensibleOnTop = true;

        extraConfig = ''
            set -g status-position top
            set -g status-style bg=default

            is_vim="ps -o state= -o comm= -t '#{pane_tty}' \ | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
            bind-key -n 'C-Left' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
            bind-key -n 'C-Down' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
            bind-key -n 'C-Up' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
            bind-key -n 'C-Right' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
                tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
            if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
                "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
            if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
                "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

            bind-key -T copy-mode-vi C-Left select-pane -L
            bind-key -T copy-mode-vi C-Down select-pane -D
            bind-key -T copy-mode-vi C-Up select-pane -U
            bind-key -T copy-mode-vi C-Right select-pane -R
        '';
    };

    home.file.".config/scripts/tmuxinatorselect".text = ''
        selection=$(tmuxinator list | sed -n '2p' | tr ' ' '\n' | grep -v '^$' | rofi -sort-order=default -dmenu | xargs)
        if [ -n "$selection" ]; then
            ghostty -e "tmuxinator start $selection; exec bash"
        else
            echo "Keine Auswahl getroffen." >&2
        fi
    '';
}
