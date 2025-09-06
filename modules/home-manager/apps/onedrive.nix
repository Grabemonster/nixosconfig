{pkgs, config, ...}:
let
onedriveMount = "${config.home.homeDirectory}/OneDrive";
in
{

    systemd.user.services.onedrive-mountpoint = {
        Unit = {
            Description = "Create OneDrive mountpoint";
        };
        Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.coreutils}/bin/mkdir -p ${onedriveMount}";
            RemainAfterExit = true;
        };
        Install.WantedBy = [ "default.target" ];  # für User-Services
    };

    systemd.user.services.rclone-onedrive = {
        Unit = {
            Description = "Rclone OneDrive Mount";
            After = [ "onedrive-mountpoint.service" ];
            Wants = [ "onedrive-mountpoint.service" ];
        };

        Service = {
            ExecStart = ''
                ${pkgs.rclone}/bin/rclone mount \
         onedrive: \
                ${onedriveMount}\
         --vfs-cache-mode=full \
         --vfs-cache-max-size 2G \
         --vfs-cache-max-age 12h \
         --dir-cache-time 12h \
         --poll-interval 15s \
         --umask 022 \
            '';
            ExecStop = "${pkgs.fuse3}/bin/fusermount3 -u ${onedriveMount}";
            Restart = "on-failure";
            RestartSec = 10;
        };

        Install = {
            WantedBy = [ "default.target" ];
        };
    };  
}
