{...}:
{
    programs.obs-studio = {
        enable = true;
    };

    home.file.".config/scripts/audio.sh".text = ''
        {pkgs.pipewire}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"SaveAudio\"
        {pkgs.pipewire}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"unSaveAudio\
        {pkgs.pipewire}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"CombinedOutput\
    '';
}
