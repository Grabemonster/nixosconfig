{...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        #autosuggestions.enable = true;
        #syntaxHighlighting = true;
        shellAliases = {
            nixrebuild = "bash ~/.config/scripts/rebuild";
        };
        #histSize = 10000;
    };
}
