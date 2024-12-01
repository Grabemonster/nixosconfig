{pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nvim/options.nix
    ./nvim/keymappings.nix
    ./nvim/plugins.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;
  };

  

}

