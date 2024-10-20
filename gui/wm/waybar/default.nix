{ config
, pkgs
, ...
}:
{
  programs = {
    waybar = {
      enable = true;
      systemd.enable = true;
      settings = [
        {
          layer = "top";
          position = "top";
          margin-top = 5;
          margin-left = 10;
          margin-right = 10;
          modules-left = [ "custom/nix" "custom/music" "mpris" "cpu" "memory" "hyprland/window" "hyprland/workspaces" ];
          modules-center = [ ];
          modules-right = [ "clock" "hyprland/language" "keyboard-state" "wireplumber" "bluetooth" "network" "custom/hyprpicker" "custom/screenshot" "custom/nix-clean" ];
          mpris = {
            player = "cider";
            interval = 1;
            format = "{status_icon} {title} by {artist}";
            tooltip = false;
            on-click = "playerctl play-pause";
            on-click-middle = "playerctl previous";
            on-click-right = "playerctl next";
            status-icons = {
              playing = "";
              paused = "";
              stopped = "";
            };
          };
          cpu = {
            format = " {usage}%";
            tooltip = false;
            interval = 1;
          };
          memory = {
            format = " {used:0.1f} GB/{total:0.1f} GB";
            tooltip = false;
            interval = 1;
           };
          clock = {
            format = " {:%H:%M}";
            tooltip = true;
            tooltip-format = " {:%A, %d %B, %Y year}";
            interval = 60;
          };
          keyboard-state = {
            capslock = true;
            numlock = false;
            scrolllock = false;
            format = "{name} {icon}";
            format-icons = {
              locked = "";
              unlocked = "";
            };
          };
          wireplumber = {
            format-icons = [ "" "" "" ];
            format = "{icon}";
            format-muted = "󰝟";
            scroll-step = 0.1;
            tooltip = true;
            tooltip-format = "{volume}% | For advanced options click on";
            on-click = "pavucontrol";
            on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
            on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
          };
          bluetooth = {
            format = "<span font='14'></span> {status}";
            format-off = "<span font='14'>󰂲</span>";
            format-on = "<span font='14'>󰂯</span>";
            format-disabled = "<span font='14'>󰂲</span>";
            format-connected = "<span font='14'></span>";
            format-no-controller = "<span font='14'>󰂲</span>";
            tooltip = true;  
            tooltip-format = "Bluetooth Status: {status}\nDevice: {device_alias}\nBattery: {device_battery_percentage}%";
            tooltip-format-off = "Bluetooth is off!";  
            tooltip-format-on = "No devices connected!";
            tooltip-format-disabled = "Bluetooth is disabled!";    
            tooltip-format-connected = "Connected: {device_alias}\nBattery: {device_battery_percentage}%"; 
            tooltip-format-no-controller = "No Bluetooth controller found!";
            on-click = "bluetoothctl power on"; 
            on-click-right = "bluetoothctl power off";  
            on-click-middle = "bluetoothctl connect 28:FA:19:20:90:1D";
          };
          network = {
            format = "";
            format-disconnected = "";
            tooltip = true;
            tooltip-format = "{bandwidthDownBytes} ↓ {bandwidthUpBytes} ↑";           
            interval = 1;
            interface = "enp6s0";
          };
          "hyprland/workspaces" = {
            format = "{name}";
          };
          "hyprland/language" = {
            format = "{}";
            keyboard-name = "evision-rgb-keyboard";
            format-en = "  English";
            format-ru = "  Russian";
            format-uk = "  Ukrainian";
          };
          "hyprland/window" = {
            format = "{}";
            rewrite = {
              "^$" = " ";
              "Alacritty" = " ";
              "Firefox Nightly" = " 󰈹";
              "(.*) \\— Firefox Nightly" = " 󰈹";
              "Discord" = " ";
              "vesktop" = " ";
              "• Discord \\| .*" = " ";
              "Discord \\| .*" = " ";
              "(.*Dmytro.*)" = " ";
              "Cider" = "<span font='14'> 󰗮</span>";
              "Steam" = "<span font='14'> 󰓓</span>";
              "Sign in to Steam" = "<span font='14'> 󰓓</span>";
            };
          };
          "custom/nix" = {
            format = "<span font='14'>󰍜</span>";
            tooltip = false;
            on-click = "eww open nix-poweroff && eww open nix-restart && eww open nix-close";
          };
          "custom/music" = {
            format = "";
            tooltip = false;
            on-click = "appimage-run /home/varmisanth/AppImage/Cider.AppImage";
          };
          "custom/hyprpicker" = {
            format = "";
            tooltip = true;
            tooltip-format = "Click to check color code on selected area";
            on-click = "/etc/nixos/gui/wm/waybar/hyprpicker.sh";
          };
          "custom/screenshot" = {
            format = "󰹑";
            tooltip = true;
            tooltip-format = "Screenshot of selected area on left click | Screenshot of fullscreen on right click"; 
            on-click = "wayshot";
            on-click-right = "hyprshot";
          };
          "custom/nix-clean" = {
            format = "";
            tooltip = true;
            tooltip-format = "Click to rebuild NixOS config and bootloader, then collect garbage and optimise the Nix Store";
            on-click = "/etc/nixos/gui/wm/waybar/nix-clean.sh";
          };
        }
      ];  
      style = ''
        ${builtins.readFile ./style/style.css}
      '';
    };
  };
}
