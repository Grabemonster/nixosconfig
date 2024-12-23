{...}:
{
  programs.nixvim.plugins = {
    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };
  };
}
