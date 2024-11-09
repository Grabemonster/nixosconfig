{pkgs, ...}:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      nixrebuild = "bash ~/.config/scripts/rebuild";
    };
  };
}
