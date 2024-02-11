{pkgs, ...}:

{

  programs.bemenu = {
    enable = true;
    package = pkgs.bemenu;
    settings = {
      layer = "top";
      position = "top";
      no-overlap = "true";
      fb = "#0E060A";
      ff = "#F8F7ED";
      nb = "#0E060A";
      nf = "#F8F7ED";
      tb = "#0E060A";
      hb = "#38191D";
      tf = "#F8F7ED";
      hf = "#F8F7ED";
      af = "#F8F7ED";
      ab = "#0E060A";
      fn = "fira-code";
      sb = "#38191D";
      sf = "#F8F7ED";
      cb = "#38191D";
      cf = "#F8F7ED";
      scb = "#38191D";
      scf = "#F8F7ED";
      bdr = "#F8F7ED";
    };
  };

}
