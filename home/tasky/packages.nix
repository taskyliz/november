{ pkgs, ... }:

{
  home.packages = [
    # Nix
    pkgs.home-manager
    pkgs.direnv
    pkgs.nixfmt-rfc-style

    # Development
    pkgs.rustup
    pkgs.pnpm
    pkgs.uv
    pkgs.bun
    pkgs.nodejs_22
    pkgs.go

    # CLI Tools
    pkgs.xh
    pkgs.gh
    pkgs.bat
    pkgs.lazygit
    pkgs.btop
    pkgs.tokei
    pkgs.dust
    pkgs.lsd
    pkgs.jq
    pkgs.fd
    pkgs.fzf
    pkgs.fastfetch
    pkgs.zoxide

    # Editors
    pkgs.neovim
    pkgs.helix

    # Shell
    pkgs.starship

    # AI Tools
    pkgs.claude-code
    pkgs.github-copilot-cli
  ];
}
