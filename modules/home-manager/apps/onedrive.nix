{pkgs, config, ...}:
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

    systemd.user.services.rclone-onedrive = {
    Unit = {
      Description = "Rclone OneDrive Mount";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount \
          onedrive:Backup \
          ${config.home.homeDirectory}/OneDrive \
          --vfs-cache-mode=full \
          --vfs-cache-max-size 2G \
          --vfs-cache-max-age 12h \
          --dir-cache-time 12h \
          --poll-interval 15s \
          --umask 022 \
          --allow-other \
          --daemon
      '';
      ExecStop = "${pkgs.fuse}/bin/fusermount -u ${config.home.homeDirectory}/OneDrive";
      Restart = "on-failure";
      RestartSec = 10;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
