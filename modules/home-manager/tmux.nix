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

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.catppuccin
    ];
  };
}
