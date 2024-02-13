{pkgs, ...}:

{ 
 services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    events = [{
        event = "before-sleep";
        command = "hyprctl -defF";
      }
      {
        event = "after-resume";
        command = "hyprctl dispatch dpms on";
      }
      {
        event = "lock";
        command = "swaylock -defF --indicator --clock --screenshots --effect-blur 50x10";
      }
    ];
    timeouts = [{
        timeout = 900;
        command = "swaylock -defF";
      }
      {
        timeout = 1200;
        command = "hyprctl dispatch dpms off";
      }
    ];
  };
}
