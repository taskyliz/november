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
    ./programs/lazygit.nix
    ./programs/helix
    ./programs/tmux.nix
    ./programs/zellij.nix
  ];

  # Replace Nix with Lix.
  nix.package = pkgs.lix;

  home.username = "tasky";
  home.homeDirectory = "/home/tasky";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "hx";
    # for ssh
    COLORTERM = "truecolor";
    NPM_CONFIG_PREFIX = "/home/tasky/.npm-global";
    LIBCLANG_PATH = "${pkgs.llvmPackages_19.libclang.lib}/lib";
    LLVM_CONFIG_PATH = "${pkgs.llvmPackages_19.llvm.dev}/bin/llvm-config";
    LD_LIBRARY_PATH = "${pkgs.llvmPackages_19.llvm.lib}/lib";
    BINDGEN_EXTRA_CLANG_ARGS = "-resource-dir=${pkgs.llvmPackages_19.libclang.lib}/lib/clang/19";
    BINDGEN_EXTRA_CLANG_ARGS_x86_64_unknown_linux_gnu = "-resource-dir=${pkgs.llvmPackages_19.libclang.lib}/lib/clang/19";
  };

  home.sessionPath = [
    "/home/tasky/.bun/bin"
    "/home/tasky/.local/bin"
    "/home/tasky/.cargo/bin"
    "/home/tasky/.npm-global/bin"
  ];
}
