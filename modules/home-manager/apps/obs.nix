{pkgs, lib, ...}:
let
pactl = ''${pkgs.pulseaudio}/bin/pactl'';
pw-link = ''${pkgs.pipewire}/bin/pw-link'';
pw-cli = ''${pkgs.pipewire}/bin/pw-cli'';
audioStartupScript = pkgs.writeShellScriptBin "audio-startup" ''
    #!${pkgs.bash}/bin/bash
    ${pw-cli} ls | tr '\n' ' ' | sed $'s/\\tid/\\n/g' | grep custom | awk '{print $1}' | tr ',' ' ' | while read id; do pw-cli destroy "$id"; done
    ${pactl} load-module module-null-sink sink_name=custom_SA sink_properties=device.description=\"SaveAudio\"
    ${pactl} load-module module-null-sink sink_name=custom_uSA sink_properties=device.description=\"unSaveAudio\"
    ${pactl} load-module module-null-sink sink_name=custom_CO sink_properties=device.description=\"CombinedOutput\"

    ${pw-link} "SaveAudio:monitor_FL" "CombinedOutput:playback_FL"
    ${pw-link} "SaveAudio:monitor_FR" "CombinedOutput:playback_FR"

    ${pw-link} "unSaveAudio:monitor_FL" "CombinedOutput:playback_FL"
    ${pw-link} "unSaveAudio:monitor_FR" "CombinedOutput:playback_FR"
    ${pactl} set-default-sink custom_uSA  
'';

updateOutputDevices = pkgs.writeShellScriptBin "device-update" ''
    devices=$(${pw-cli} ls| tr '\n' ' '| sed $'s/\\tid/\\n\\n&/g' | grep -v custom | grep output | tr '\t' '\n' | grep node.name | awk -F '"' '{print $2}')
    for device in $devices; do
        echo "Verbinde Gerät $device mit custom_CO" > /tmp/audio-debug.log
        ${pw-link} "custom_CO" "$device" 
    done
'';
in{

    
    home.packages = [
        updateOutputDevices
    ];

    systemd.user.services.audioStartup = {
        Unit = {
            Description = "Audio Startup";
            After = [ "pipewire.service" "pipewire-pulse.service" "default.target" ];
            Wants = [ "pipewire.service" "pipewire-pulse.service" ];
        };
        Service = {
            ExecStart = "${audioStartupScript}/bin/audio-startup";
            Type = "oneshot";
        };
        Install = {
            WantedBy = [ "default.target" ];
        };
    };

    systemd.user.services.device-linker = {
        Unit = {
            Description = "Verbindet PipeWire Geräte nach dem Login";
            After = [ "graphical-session.target" ]; # oder "hyprland-session.target", je nach Setup
            PartOf = [ "graphical-session.target" ]; # optional
        };
        Service = {
            ExecStart = ''${updateOutputDevices}/bin/device-update'';
            Type = "oneshot";
        };
        Install = {
            WantedBy = [ "graphical-session.target" ]; # läuft nur, wenn du eingeloggt bist
        };
    };
    home.activation.updateDevices = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ${updateOutputDevices}/bin/device-update
    '';
}
