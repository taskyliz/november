{ ... }:

{
  imports = [
    ./settings.nix
    ./keys-normal.nix
    ./keys-insert.nix
    ./keys-select.nix
  ];

  programs.helix.enable = true;
}
