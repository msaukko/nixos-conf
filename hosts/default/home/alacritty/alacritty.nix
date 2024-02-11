{pkgs, ...}:

{

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "zsh";
      };
      window = {
        opacity = 0.95;
        dynamic_title = true;
      };
      colors = {
        primary = {
          background = "0x0e060a";
          foreground = "0xd0d0d0";
        };
        normal = {
          black = "0x38191d";
          red = "0xfea19a";
          green = "0xe5ce7a";
          yellow = "0xd97d59";
          blue = "0x80bacf";
          magenta = "0xffd8d6";
          cyan = "0xabdbec";
          white = "0xf8f7ed";
        };
        bright = {
          black = "0x505050";
          red = "0xfea19a";
          green = "0xe5ce7a";
          yellow = "0xd97d59";
          blue = "0x80bacf";
          magenta = "0xffd8d6";
          cyan = "0xabdbec";
          white = "0xf8f7ed";
        };
      };
    };
  };

}
