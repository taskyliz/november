{ ... }:

{
  imports = [
    ./settings.nix
    ./keys-normal.nix
    ./keys-insert.nix
    ./keys-select.nix
    ./languages.nix
  ];

  programs.helix.enable = true;
}
