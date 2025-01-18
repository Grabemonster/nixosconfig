{lib, ...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableVteIntegration = true;
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
        initExtra = ''
            # ~/.zshrc
            export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
            zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
            source <(carapace _carapac)
            zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
            '';
    };

    programs.carapace = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = true;
            format = lib.concatStrings [
                "$directory"
                "$character"
            ];
            right_format = lib.concatStrings [
                "$git_branch"
            ];
            scan_timeout = 10; 
            character = {
                format = "$symbol ";
                success_symbol = "\\$";
                error_symbol = "\\$";
            };
            directory = {
                format = "\\[[$path]($style)[$read_only]($read_only_style)\\]";
                read_only = "🔒";
                truncate_to_repo = false;
                truncation_length = 3;
                truncation_symbol = ".../";
            };
        };
    };
}
