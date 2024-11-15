{pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    settings = {
      opener.edit = [{
        block = true;
        run = "nvim $@";
      }];
    };
  };
}
