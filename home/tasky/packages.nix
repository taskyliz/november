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
    zig
    dotnet-sdk_8
    bacon
    kotlin
    kotlin-native
    gradle

    # Language Servers
    typescript-language-server
    nil
    zls # Zig Language Server
    fsautocomplete # F# Language Server
    kotlin-language-server

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
    graphite-cli
    infisical

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
