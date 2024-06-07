{pkgs, ...}:

{

  home.file = {
    "wordlists/" = {
      source = builtins.fetchGit {
        url = "https://github.com/danielmiessler/SecLists.git";
        rev = "e70ad2dcf60021917e22b24f5eec574d8e1ee0dc";
      };
    };
  };

}

