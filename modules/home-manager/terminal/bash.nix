{pkgs, ...}:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      nixrebuild = "bash ~/.config/scripts/rebuild";
    };
    bashrcExtra = ''
    export EDITOR="nvim"
    '';
  };
}
