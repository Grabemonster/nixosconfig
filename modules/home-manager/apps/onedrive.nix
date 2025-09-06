{pkgs, config, ...}:
{
    systemd.user.services.rclone-onedrive = {
    Unit = {
      Description = "Rclone OneDrive Mount";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStartPre = ''
            ${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/OneDrive || true'
        '';
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
