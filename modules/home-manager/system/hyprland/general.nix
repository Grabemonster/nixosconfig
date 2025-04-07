{...}:
{
wayland.windowManager.hyprland.settings = {
  general = {
    "gaps_in" = "2";
    "gaps_out" = "5";

    "border_size" = "2";

    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";

    "resize_on_border" = "true";
         
    "layout" = "dwindle";
  };
};

home.file.".config/hypr/xdph.conf".text = ''
    allow_token_by_default = true
'';
}
