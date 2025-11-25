{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix
    home-manager
    direnv
    nixfmt-rfc-style

    # Development
    rustup
    pnpm
    uv
    bun
    nodejs_22
    go

    # Language Servers
    typescript-language-server
    nil

    # CLI Tools
    xh
    gh
    bat
    lazygit
    btop
    tokei
    dust
    lsd
    jq
    fd
    fzf
    fastfetch
    zoxide
    ripgrep
    tombi
    zoxide
    scooter
    aria2

    # Editors
    neovim
    helix

    # Shell
    starship

    # AI Tools
    claude-code
    github-copilot-cli
  ];
}
