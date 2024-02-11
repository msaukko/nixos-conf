{ config, pkgs, ... }:

{
  home.username = "halko";
  home.homeDirectory = "/home/halko";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    swaylock-effects
    swayidle
    htop
    psensor
    feh
    file
    netcat
    openvpn
    bemenu
    brightnessctl
    hyprpaper
    discord
    dolphin
    libnotify
    unzip
    gzip
    jq
  ];

  # Allowing unfree for nixpkgs in home manager
  nixpkgs.config.allowUnfree = true;

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Importing all specific program configs
  imports = [ 
    ./home/hyprland/hyprland.nix
    ./home/swayidle/swayidle.nix
    ./home/waybar/waybar.nix
    ./home/zsh/zsh.nix
    ./home/alacritty/alacritty.nix
    ./home/firefox/firefox.nix
    ./home/hyprpaper/hyprpaper.nix
    ./home/sshconfig/sshconfig.nix
    ./home/mako/mako.nix
  ];

  # Session variables
  home.sessionVariables = {
    EDITOR = "vim";
    BEMENU_BACKEND = "wayland";
  };

  # Letting home manager manage it self.
  programs.home-manager.enable = true;

}
