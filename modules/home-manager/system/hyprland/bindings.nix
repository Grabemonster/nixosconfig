{pkgs, lib, ...}:
{
  wayland.windowManager.hyprland.settings = {
   "$terminal" = "ghostty";
   "$fileManager" = ''bash ~/.config/scripts/tmuxinatorselect'';
   "$firefox" = "firefox";
   "$wofi" = ''rofi -show drun -show-icons''; 
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
        "$mod, V, exec, cliphist list | rofi -sort-order=default -dmenu | cliphist decode | wl-copy"

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

#audio
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        #player
        ",XF86AudioPlay, exec, playerctl play-pause,"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioStop, exec, playerctl stop"

        #"$mod, G, split:grabroguewindows"
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
