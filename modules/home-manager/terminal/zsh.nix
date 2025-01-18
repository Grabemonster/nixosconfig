{...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableVteIntegration = true;
        #autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            nixrebuild = "bash ~/.config/scripts/rebuild";
        };
        history = {
            append = true;
            expireDuplicatesFirst = true;
            extended = true;
            ignoreDups = true;
            save = 10000;
            share = true;
            size = 10000;

        };
    };
}
