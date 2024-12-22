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
        tmuxinator.enable = true;

        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.yank 
        ];
        sensibleOnTop = true;

    };

    home.file.".config/scripts/tmuxinatorselect".text = ''
        selection=$(tmuxinator list | sed -n '2p' | tr ' ' '\n' | grep -v '^$' | wofi --dmenu | xargs)
        echo $selection
        if [ -n "$selection" ]; then
            gnome-terminal -- bash -c 'tmuxinator start $selection; exec bash'
        else
            echo "Keine Auswahl getroffen." >&2
        fi
    '';
}
