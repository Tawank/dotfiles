#!/usr/bin/env bash

handle() {
  case "$1" in
    monitoraddedv2*)
      IFS=',' read -r mon_id mon_name mon_desc <<< "$(echo "$1" | cut -d'>' -f3)"

      if [[ "$mon_desc" == "Dell Inc. DELL P2422H DX5G8M3" ]]; then
        hyprctl dispatch moveworkspacetomonitor 2 "$mon_name"
        hyprctl dispatch workspace 2
      elif [[ "$mon_desc" == "GIGA-BYTE TECHNOLOGY CO. LTD. M27Q 24520B001178" ]]; then
        hyprctl dispatch moveworkspacetomonitor 1 "$mon_name"
        hyprctl dispatch workspace 1
      elif [[ "$mon_desc" == "Acer Technologies Acer VG240YU 0x11016D1A" ]]; then
        hyprctl dispatch moveworkspacetomonitor 3 "$mon_name"
        hyprctl dispatch workspace 3
      fi
      ;;
    *) ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  handle "$line"
done
