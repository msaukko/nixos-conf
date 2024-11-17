{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nethack-x11
  ];

}

