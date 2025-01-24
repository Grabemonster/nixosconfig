{...}:
{
    programs.nixvim.plugins = {
# Includes all parsers for treesitter
        treesitter = {
            enable = true;
            settings = {
                highlight.enable = true;
                additional_vim_regex_highlighting = [ "markdown" ];
            };
        };
    };
}
