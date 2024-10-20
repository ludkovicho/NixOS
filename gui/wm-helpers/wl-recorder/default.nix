{ pkgs ? import <nixpkgs> {} }:
pkgs.writeShellScriptBin "wl-recorder" ''
  #!/run/current-system/sw/bin/bash
  SAVE_DIR="$HOME/Videos"
  mkdir -p "$SAVE_DIR"
  DATE=$(date +%Y-%m-%d_%H-%M-%S)
  FILENAME="$SAVE_DIR/$DATE.mp4"
  START=$'\uF04B' 
  echo  "Recording started... $START"
  echo  "Press Ctrl+C to get the video... 󰩍"
  wl-screenrec --filename "$FILENAME" --audio --audio-device bluez_sink.28_FA_19_20_90_1D.a2dp_sink.monitor --no-damage --bitrate=2MB --low-power=off > /dev/null 2>&1
  trap 'echo -e "\nRecording stopped."; exit' SIGINT
  wait
''
