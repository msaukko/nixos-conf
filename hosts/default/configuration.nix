{ config, pkgs, inputs, ...}:

let
  dbus-hyprland-environment = pkgs.writeTextFile {
    name = "dbus-hyprland-environment";
    destination = "/bin/dbus-hyprland-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Boot options and disk encryption management
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.luksroot = { device = "/dev/disk/by-uuid/462f844b-2fa7-454a-a441-b36341e4cd8b"; preLVM = true; allowDiscards = true; };

  # System config
  system.stateVersion = "23.11";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";

  # Set keyboard layout
  services.xserver.xkb.layout = {
    layout="fi";
  };
  
  # User config
  users.users.halko = {
    isNormalUser = true;
    home = "/home/halko";
    description = "Halko";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };

  # Home-manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "halko" = import ./home.nix;
    };
  };

  # environment config
  environment.variables = {
    EDITOR = "vim";
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  time.timeZone = "Europe/Helsinki";

  # env sys pkgs
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    neofetch
    pavucontrol
    pulseaudioFull
    dbus
    xdg-utils
    wl-clipboard
    mako
    wdisplays
    slurp
    grim
  ];

  # os config
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    noto-fonts-emoji
  ];
  security.pam.services.swaylock = {};
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudioFull ];
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = "*";
  };

  # System wide enabled programs
  programs.zsh.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["halko"];
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Network config
  networking.networkmanager.enable = true;
  networking.hostName = "wlrs-2";

  # Security config
  security.polkit.enable = true;  

}

