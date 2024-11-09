{pkgs, ...}:
{
programs.git = {
  enable = true;
  package = pkgs.git;
  userName = "Grabemonster";
  userEmail = "example@example.net";
  extraConfig = {
    init = {
      defaultBranch = "master";
    };

    core.editor = "vim";

    url = {
      "https://github.com/" = {
	insteadOf = [
	  "gh:"
	  "github:"
        ];
      };
    };
  };
};
}
