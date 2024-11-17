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
  
  # System config
  system.stateVersion = "24.05";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-24.05";

  # Set keyboard layout
  services.xserver.xkb.layout = {
    layout="fi";
  };
  services.blueman.enable = true; 
  # User config
  users.users.otter = {
    isNormalUser = true;
    home = "/home/otter";
    description = "Otter";
    shell = pkgs.zsh;
    extraGroups = [ "libvirtd"  "wheel" "networkmanager" "video" "audio" ];
  };

  # KVM
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable= true;

  # Home-manager config
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "otter" = import ./home.nix;
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
  programs.dconf.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Network config
  networking.extraHosts = ''
  '';
  networking.networkmanager.enable = true;
  networking.hostName = "lairtop";
  # Security config
  security.polkit.enable = true;  

}

