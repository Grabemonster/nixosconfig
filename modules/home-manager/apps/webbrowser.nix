{user, pkgs, ...}:
{
 
  programs.firefox = {
    enable = true;
    languagePacks = ["en_US" "de"];
    package = pkgs.firefox;
    profiles."${user}" = {
      id = 0;
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
      ];
      settings = {
        "browser.newtabpage.pinned" = [{
          title="home-manager";
          url="https://nix-community.github.io/home-manager/options.xhtml";
        }];
        "extensions.autoDisableScopes" = 0;
      };
    };
  };

  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
      "--disable-password-manager"
    ];
    dictionaries = [
      pkgs.hunspellDictsChromium.en_US
      pkgs.hunspellDictsChromium.de_DE
    ];
    extensions = [
      {id = "nngceckbapebfimnlniiiahkandclblb";}
    ];
  };
}
