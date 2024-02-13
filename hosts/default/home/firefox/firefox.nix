{pkgs, ...}:

{

  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "foxyproxy@eric.h.jung" = {
           install_url = "https://addons.mozilla.org/firefox/downloads/file/4228676/foxyproxy_standard-8.9.xpi";
           installation_mode = "force_install";
        };
        # Ublock
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4216633/ublock_origin-1.55.0.xpi";
          installation_mode = "force_install";
        };
        # 1Password
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4232852/1password_x_password_manager-2.20.2.xpi";
          installation_mode = "force_install";
        };
        # Privacy badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4232703/privacy_badger17-2024.2.6.xpi";
          installation_mode = "force_install";
        };
      };
      SearchEngines = {
        Default = "DuckDuckGo";
      };
    };
  };

}

