{...}:
{
    programs.nixvim.plugins = {
        markdown-preview = {
            enable = true;
            settings = {
                browser = "firefox";
                theme = "dark";
                port = "8894";
            };
        };
    };
}
