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
      credential."https://github.com" = {
        helper = "!/home/tasky/.nix-profile/bin/gh auth git-credential";
      };
      credential."https://gist.github.com" = {
        helper = "!/home/tasky/.nix-profile/bin/gh auth git-credential";
      };
    };
  };
}
