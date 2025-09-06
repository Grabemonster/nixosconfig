{...}:
{
    programs.onedrive = {
        enable = true;
        settings = {
            check_nomount = "true";
            check_nosync = "false";
            classify_as_big_delete = "1000";
            cleanup_local_files = "false";
            disable_notifications = "false";
            no_remote_delete = "false";
            rate_limit = "0";
            resync = "false";
            skip_dotfiles = "true"; 
            bypass_data_preservation = "false";
            disable_download_validation = "false";
            download_only = "false";
            permanent_delete = "false";
            skip_file = "~*|.~*|*.tmp|*.swp|*.partial";
            skip_symlinks = "false";
            space_reservation = "1000";
            sync_dir = "/srv/games/Onedrive";
        };
    };
}
