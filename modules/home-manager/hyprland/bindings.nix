{pkgs, lib, ...}:
{
    wayland.windowManager.hyprland.settings = {
        "$terminal" = "gnome-terminal";
        "$fileManager" = ''
            selection=$(tmuxinator list | sed -n '2p' | tr ' ' '\n' | grep -v '^$' | wofi --dmenu)
            if [ -n "$selection" ]; then
                tmuxinator start "$selection"
            else
                echo "Keine Auswahl getroffen." >&2
                    fi
                    '';
        "$firefox" = "firefox";
        "$wofi" = "wofi"; 
        "$background" = "bash ~/.config/scripts/randomimage.sh";

        "$mod" = "SUPER";

        bind = [
            "$mod, Q, exec, $terminal"
                "$mod, E, exec, $fileManager"
                "$mod, C, killactive"
                "$mod, M, exec, wlogout -b 2"
                "$mod, H, togglefloating"
                "$mod, SPACE, exec, $wofi"
                "$mod, U, exec, $background"

#clipboards
                "$mod, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy"

#Move focus
                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

#Move Window
                "$mod SHIFT, up, movewindow, u"
                "$mod SHIFT, down, movewindow, d"
                "$mod SHIFT, right, movewindow, r"
                "$mod SHIFT, left, movewindow, l"

#recize Window
                "$mod CTRL, up, resizeactive, 0 -50"
                "$mod CTRL, down, resizeactive, 0 50"
                "$mod CTRL, right, resizeactive, 50 0"
                "$mod CTRL, left, resizeactive, -50 0"
                ]
                ++ (
                        builtins.concatLists (builtins.genList (i:
                                let ws = i + 1;
                                in [
                                "$mod, code:1${toString i}, workspace, ${toString ws}"
                                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                                ]
                                )
                            9)
                   );

        bindm = [
            "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
        ];
    };
}
