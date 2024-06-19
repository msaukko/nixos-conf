{pkgs, ...}:

{
  home.packages = with secpkgs; [
    autopsy
  ];
};
