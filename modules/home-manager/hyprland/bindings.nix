{pkgs, lib, ...}:
{
  wayland.windowManager.hyprland.settings = {
   "$terminal" = "gnome-terminal";
   "$fileManager" = ''gnome-terminal -e lf'';
   "$firefox" = "firefox";
   "$wofi" = "wofi --show"; 
   "$background" = "bash ~/.config/scripts/randomimage.sh";

   "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive"
        "$mod, M, exec, wlogout"
        "$mod, H, togglefloating"
      "$mod, SPACE, exec, $wofi"
      "$mod, U, exec, $background"

        #Move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
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
