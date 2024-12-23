{config, pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        package = pkgs.tmux;

        baseIndex = 1;
        clock24 = true;
        keyMode = "vi";
        mouse = true;
        prefix = "M";
        terminal = "screen-256color";
        resizeAmount = 20;
        tmuxinator.enable = true;

        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.yank
            {
                plugin = tmuxPlugins.dracula;
                extraConfig = ''
                    set -g @dracula-show-powerline true
                    set -g @dracula-fixed-location "Germany"
                    set -g @dracula-show-flags true
                    set -g @dracula-show-left-icon session
                '';
            }
        ];
        sensibleOnTop = true;

        extraConfig = ''
            { "command": { "action": "moveFocus", "direction": "down" }, "keys": "alt+down" }, 
            { "command": { "action": "moveFocus", "direction": "left" }, "keys": "alt+left" }, 
            { "command": { "action": "moveFocus", "direction": "right" }, "keys": "alt+right" }, 
            { "command": { "action": "moveFocus", "direction": "up" }, "keys": "alt+up" }, 
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
