{
  description = "november (server) configuration because yes";

  inputs = {
    # https://github.com/isabelroses/dotfiles/blob/b15f091392da7b975d5ae841b455de076fa3f504/flake.nix#L14C1-L14C81
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      homeConfigurations.tasky = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          ./home/tasky/home.nix
        ];
      };
    };
}
