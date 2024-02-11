{config, ...}:

{
  home.file = { 
    ".config/hypr/hyprpaper.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ./hyprpaper.conf;
      executable = false;
    };
    ".config/hypr/wallpaper-lakeside-deer.png" = {
      source = config.lib.file.mkOutOfStoreSymlink ./wallpaper-lakeside-deer.png;
    };
  };
}
