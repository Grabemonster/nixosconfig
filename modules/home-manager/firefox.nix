{user, pkgs, inputs, ...}:
{
 
  programs.firefox = {
    enable = false;
    languagePacks = ["en_US" "de"];
    package = pkgs.firefox;
    profiles."${user}" = {
      id = 0;
      isDefault = true;
      extensions = with inputs.firefox-addons; [bitwarden];
      
      bookmarks = [
        {
          name = "home-manager";
          tags = ["nix" "home" "manager"];
          keyword = "home-manager";
          url = "https://nix-community.github.io/home-manager/options.xhtml";
        }
      ];
      settings = {
        "browser.startup.homepage" = "https://google.com";
      };
    };
  };
}
