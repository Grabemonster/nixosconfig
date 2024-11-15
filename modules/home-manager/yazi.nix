{pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    settings = {
      keymap = {

      };
      theme = {};
      yazi = {
        manager = {
          ratio = [1 4 4];
        };
      };
    };
  };
}
