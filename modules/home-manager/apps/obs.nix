{pkgs, ...}:
let
pactl = ''${pkgs.pulseaudio}/bin/pactl'';
pw-link = ''${pkgs.pipewire}/bin/pw-link'';
in
{
    programs.obs-studio = {
        enable = true;
    };

    home.file.".config/scripts/audio.sh".text = ''
        ${pkgs.pipewire}/bin/pw-cli ls | tr '\n' ' ' | sed $'s/\\tid/\\n/g' | grep custom | awk '{print $1}' | tr ',' ' ' | while read id; do pw-cli destroy "$id"; done
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom_SA sink_properties=device.description=\"SaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom_uSA sink_properties=device.description=\"unSaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom_CO sink_properties=device.description=\"CombinedOutput\"

        ${pw-link} "SaveAudio:monitor_FL" "CombinedOutput:playback_FL"
        ${pw-link} "SaveAudio:monitor_FR" "CombinedOutput:playback_FR"

        ${pw-link} "unSaveAudio:monitor_FL" "CombinedOutput:playback_FL"
        ${pw-link} "unSaveAudio:monitor_FR" "CombinedOutput:playback_FR"
        ${pactl} set-default-sink customuSA


        
# Hole alle Ausgabegeräte (außer dem custom Sink)
        devices=$(pw-cli ls| tr '\n' ' '| sed $'s/\\tid/\\n\\n&/g' | grep -v custom | grep output | tr '\t' '\n' | grep node.name | awk -F '"' '{print $2}')

# Verbinde jedes Gerät mit dem virtuellen Sink
        for device in $devices; do
            echo "Verbinde Gerät $device mit custom_CO"
            pw-link "custom_CO" "$device" 
        done

    '';
}
