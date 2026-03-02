{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "taskylizard";
        email = "75871323+taskylizard@users.noreply.github.com";
      };

      diff = {
        algorithm = "patience";
        colorMoved = "default";
      };
      fetch = {
        prune = true;
      };
      pull = {
        rebase = true;
        ff = "only";
      };
      init = {
        defaultBranch = "trunk";
      };
      push = {
        autoSetupRemote = true;
      };

      credential = {
        helper = "store";
      };
    };
  };
}
