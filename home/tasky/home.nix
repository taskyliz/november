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
    ./programs/git-extra.nix
    ./programs/helix
    ./programs/tmux.nix
    ./programs/zellij.nix
  ];

  home.username = "tasky";
  home.homeDirectory = "/home/tasky";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "hx";
    # for ssh
    COLORTERM = "truecolor";
    LIBCLANG_PATH = "${pkgs.llvmPackages_19.libclang.lib}/lib";
    LLVM_CONFIG_PATH = "${pkgs.llvmPackages_19.llvm.dev}/bin/llvm-config";
    LD_LIBRARY_PATH = "${pkgs.llvmPackages_19.llvm.lib}/lib";
  };

  home.sessionPath = [
    "/home/tasky/.bun/bin"
    "/home/tasky/.local/bin"
    "/home/tasky/.cargo/bin"
  ];
}
