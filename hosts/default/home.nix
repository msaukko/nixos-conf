{ config, pkgs, ... }:

{
  home.username = "otter";
  home.homeDirectory = "/home/otter";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    bemenu
    bitwarden-desktop
    brightnessctl
    dnsutils
    dolphin
    element-web
    feh
    file
    freecad
    gimp
    gzip
    htop
    hyprpaper
    jq
    libnotify
    mqttx
    mtr
    netcat
    nextcloud-client
    nmap
    obsidian
    openscad
    openvpn
    p7zip
    prusa-slicer
    psensor
    remmina
    signal-desktop
    spotify
    swayidle
    swaylock-effects
    tcpdump
    thunderbird
    tor-browser
    transmission
    unetbootin
    unrar
    unzip
    vlc
    vscodium
    whois
    wireshark
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
    ./home/easyeffects/easyeffects.nix
    ./pkg-sets/security/security.nix
    ./pkg-sets/security/wordlists.nix
    ./pkg-sets/security/nixos-security.nix
    ./games/games.nix
  ];
  
  # Session variables
  home.sessionVariables = {
    EDITOR = "vim";
    BEMENU_BACKEND = "wayland";
  };

  # Letting home manager manage it self.
  programs.home-manager.enable = true;

}
