{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./packages.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/helix
  ];

  home.username = "tasky";
  home.homeDirectory = "/home/tasky";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "hx";
    # for ssh
    COLORTERM = "truecolor";
  };
}
