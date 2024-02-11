{pkgs, ...}:

{

  services.mako = {
    enable = true;
    font = "fira-code 10";
    backgroundColor = "#38191D";
    textColor = "#F8F7ED";
    borderColor = "#0E060A";
    defaultTimeout = 4000;
    ignoreTimeout = true;
    borderRadius = 5;
  };

}
