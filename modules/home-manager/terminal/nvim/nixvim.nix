{pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymappings.nix
    ./plugins/plugins.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;
  };
}

