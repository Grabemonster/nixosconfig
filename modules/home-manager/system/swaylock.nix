{pkgs, ...}:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };
  home.file.".config/swaylock/config".text = ''
    ignore-empty-password

    clock
    timestr=%R
    datestr=%a, %e of %B

    image=~/.cache/activwalpaper.jpg

    fade-in=1
    effect-pixelate=5

    indicator
    indicator-radius=200
    indicator-thickness=20

    key-hl-color=00000066
    separator-color=00000000

    inside-color=00000033
    inside-clear-color=ffffff00
    inside-caps-lock-color=ffffff00
    inside-ver-color=ffffff00
    inside-wrong-color=ffffff00

    ring-color=ffffff
    ring-clear-color=ffffff
    ring-ver-color=ffffff
    ring-wrong-color=ffffff

    text-color=ffffff
    text-clear-color=ffffff
    text-ver-color=ffffff
    text-wrong-color=ffffff

    bs-hl-color=ffffff
  ''; 


  services.swayidle = {
    enable = true;
  };
  home.file.".config/scripts/lockscreentime.sh".text = ''
    #!${pkgs.bash}/bin/bash

    ${pkgs.swayidle}/bin/swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
  '';

}
