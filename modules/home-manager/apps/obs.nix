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
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom sink_properties=device.description=\"SaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom sink_properties=device.description=\"unSaveAudio\"
        ${pkgs.pulseaudio}/bin/pactl load-module module-null-sink sink_name=custom sink_properties=device.description=\"CombinedOutput\"

        ${pw-link} "SaveAudio:monitor_FL" "CombinedOutput:playback_FL"
        ${pw-link} "SaveAudio:monitor_FR" "CombinedOutput:playback_FR"

        ${pw-link} "unSaveAudio:monitor_FL" "CombinedOutput:playback_FL"
        ${pw-link} "unSaveAudio:monitor_FR" "CombinedOutput:playback_FR"

        # Ziel-Ports
TARGET_L="unSaveAudio:playback_FL"
TARGET_R="unSaveAudio:playback_FR"

# Alle Output-Ports durchsuchen (z.B. von Programmen)
${pw-link} -o | grep -E "output_(FL|FR)" | while read port; do
  # Prüfe, ob bereits mit SaveAudio verbunden
  if ! ${pw-link} | grep -q "SaveAudio.*-> $port"; then
    # Bestimme, ob FL oder FR und verbinde entsprechend
    if [[ "$port" == *output_FL ]]; then
      echo "🔗 Verbinde $port → $TARGET_L"
      ${pw-link} "$port" "$TARGET_L"
    elif [[ "$port" == *output_FR ]]; then
      echo "🔗 Verbinde $port → $TARGET_R"
      ${pw-link} "$port" "$TARGET_R"
    fi
  else
    echo "⏭️  Überspringe $port (bereits mit SaveAudio verbunden)"
  fi
done
id = $(pactl list sinks | tr '\n' ' ' | sed $'s/Sink/\\n/g' | grep unSaveAudio | awk '{print $1}' | tr -d '#')
echo $id
pactl set-default-sink $id
    '';
}
