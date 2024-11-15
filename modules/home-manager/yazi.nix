{pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    settings = {
      opener.edit = [{
        block = true;
        run = "nvim $@";
      }];
      manager = {
        show_hidden = false;
        sort_dir_first = true;
        layout = [1 4 4];
      };
      
      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [0 0 0 0];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
  };
}
