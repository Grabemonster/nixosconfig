{pkgs, ...}:
{
    programs = {
        nushell = { 
          enable = false;
          # for editing directly to config.nu 
          extraConfig = ''
           $env.config = {
            show_banner: false,
            completions: {
            case_sensitive: false # case-sensitive completions
            quick: true    # set to false to prevent auto-selecting completions
            partial: true    # set to false to prevent partial filling of the prompt
            algorithm: "fuzzy"    # prefix or fuzzy
            external: {
            # set to false to prevent nushell looking into $env.PATH to find more suggestions
                enable: true 
            # set to lower can improve completion performance at the cost of omitting some options
                max_results: 100 
              }
            }
           } 
           $env.PATH = ($env.PATH | 
           split row (char esep) |
           prepend /home/myuser/.apps |
           append /usr/bin/env
           )
           '';
           shellAliases = {
               nixrebuild = "bash ~/.config/scripts/rebuild";
           };

           environmentVariables = {
                EDITOR = "nvim";
                SHELL = "${pkgs.nushell}/bin/nu";
           };
       };  
       carapace.enable = true;
       carapace.enableNushellIntegration = true;

       };
}
