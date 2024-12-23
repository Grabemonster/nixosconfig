{...}:
{
    programs.nixvim = {
        plugins.yazi = {
            enable = true;
            settings = {
                enable_mouse_support = true;
                floating_window_scaling_factor = 0.8;
                log_level = "debug";
                open_for_directories = true;
                yazi_floating_window_border = "single";
                yazi_floating_window_winblend = 0;
                keymaps = {
                    copy_relative_path_to_selected_files = "<C-y>";
                    cycle_open_buffers = "<tab>";
                    grep_in_directory = "<C-s>";
                    open_file_in_horizontal_split = "<C-x>";
                    open_file_in_tab = "<C-t>";
                    open_file_in_vertical_split = "<C-v>";
                    replace_in_directory = "<C-g>";
                    send_to_quickfix_list = "<C-q>";
                    show_help = "<f1>";
                };
            };
        };
    };
}
