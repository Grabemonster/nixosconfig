{pkgs, ...}:
let
pactl = ''${pkgs.pulseaudio}/bin/pactl'';
in
{
    programs.obs-studio = {
        enable = true;
    };

    home.file.".config/scripts/audio.sh".text = ''
        ${pkgs.pipewire}/bin/pw-cli ls | tr '\n' ' ' | sed $'s/\\tid/\\n/g' | grep CombinedOutput | awk '{print $1}' | tr ',' ' ' | while read id; do pw-cli destroy "$id"; done
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"SaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"unSaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=CombinedOutput sink_properties=device.description=\"CombinedOutput\"
    '';
}
