{pkgs, ...}:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["en_US" "de"];
    package = pkgs.firefox.override {
      nativeMassagingHosts = [
	pkgs.bitwarden
      ];
    };
  };
}
