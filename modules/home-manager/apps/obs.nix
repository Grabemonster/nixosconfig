{pkgs, ...}:
{
    programs.obs-studio = {
        enable = true;
    };

    home.file.".config/scripts/audio.sh".text = ''
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"SaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"unSaveAudio\
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"CombinedOutput\
    '';
}
