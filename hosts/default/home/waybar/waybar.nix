{pkgs, ...}:

{

  programs.waybar.style = ./waybar.css;

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;
    settings = [{
        height = 30;
        layer = "top";
        position = "top";
        tray = { spacing = 3; };
        modules-center = [ "hyprland/window" ];
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "pulseaudio" "network" "cpu"
          "memory" "battery"
          "clock" "tray"
        ];
        battery = {
          format = "{icon}  {capacity}%";
          format-alt = "{time}  {icon}";
          format-icons = [ "" "" "" "" "" ];
          format-plugged = "{capacity}%  ";
          format-charging = "{capacity}%  ";
          states = {
            critical = 15;
            warning = 30;
          };
        };
        clock = {
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = { format = "{}% "; };
        network = {
          interval = 1;
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "Disconnected ⚠";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} up: {bandwidthUpBits} down: {bandwidthDownBits}";
          format-linked = "{ifname} (No IP)";
          format-wifi = "{essid} ({signalStrength}%) ";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            default = [ "" "" "" ];
            headphones = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
              "6" = [];
              "7" = [];
              "8" = [];
              "9" = [];
              "10" = [];
          };
          format = "{name} {icon}";
          format-icons = {
            urgent = " ";
            active = " ";
            default = " ";
          };
        };
      }
    ];
  };

}
