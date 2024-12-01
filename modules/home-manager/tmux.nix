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
    terminal = "screen";

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.catppuccin
    ];
    sensibleOnTop = true;

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:TC"
    '';
  };
}
