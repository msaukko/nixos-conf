{pkgs, ...}:

{

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout="fi";
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
    };
    exec-once = "hyprpaper";
    windowrulev2 = "idleinhibit always, fullscreen:1;";
    monitor = "eDP-1,1920x1080@60,0x0,1";
    "$mod" = "SUPER";
    "$mod_sft" = "SUPER_SHIFT";
    "$terminal" = "alacritty";
    "$menu" = "bemenu-run";
    "$bar" = "waybar";
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, moveintogroup"
      "$mod_sft, mouse:272, movewindoworgroup"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, pactl -- set-sink-volume @DEFAULT_SINK@ +5%"
      ", XF86AudioLowerVolume, exec, pactl -- set-sink-volume @DEFAULT_SINK@ -5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
    ];
    bind = [
      "$mod, Return, exec, $terminal"
      "$mod_sft, F, exec, firefox"
      "$mod_sft, Q, killactive"
      "$mod_sft, C, exec, hyprctl dispatch exit"
      "$mod, F, fullscreen"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod_sft, left, movewindow, l"
      "$mod_sft, right, movewindow, r"
      "$mod_sft, up, movewindow, u"
      "$mod_sft, down, movewindow, d"
      "$mod_sft, O, exec, swaylock --indicator --clock --screenshots --effect-blur 50x10"
      "$mod_sft, SPACE, togglefloating"
      "$mod, D, exec, $menu"
      "$mod, W, togglegroup"
      "$mod_sft, W, moveoutofgroup"
      "$mod, Tab, changegroupactive"
      "$mod_sft, Print, exec, slurp | grim -t jpeg -g - ~/screenshots/$(date +'%H:%M:%S').jpeg"
      "$mod, Print, exec, grim -t jpeg ~/screenshots/$(date +'%H:%M:%S').jpeg"
      ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
    ]
    ++ (
      builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString(x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )10)
      );

    decoration = {
      rounding = 7;
      active_opacity = 1;
      inactive_opacity = 0.95;
      fullscreen_opacity = 1;
      dim_inactive = true;
      dim_strength = 0.1;
      blur = {
        enabled = true;
        size = 7;
      };
    };
  };

}
