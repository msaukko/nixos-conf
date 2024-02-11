{config, ...}:

{

  home.file = {
    ".ssh/config" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config;
      executable = false;
    };
  };

}
