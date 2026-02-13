{ pkgs, llm-agents-pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix
    home-manager
    quickenv
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
    crystal
    sqlite
    llvmPackages_19.libclang
    llvmPackages_19.llvm
    sccache
    mold
    jdk
    deno
    jujutsu
    lazyjj

    # Profiling & Benchmarking
    hyperfine
    samply
    linuxPackages.perf
    heaptrack
    cargo-flamegraph

    # Language Servers
    typescript-language-server
    nil
    zls # Zig Language Server
    fsautocomplete # F# Language Server
    kotlin-language-server
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint LSPs
    nodePackages.prettier

    # CLI Tools
    xclip
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
    scooter
    aria2
    graphite-cli
    infisical
    glow
    rsync
    cloudflared
    filebrowser
    git-town

    # Editors
    neovim
    helix

    # Shell
    starship
    zellij

    # AI Tools
    llm-agents-pkgs.amp
    llm-agents-pkgs.claude-code
    llm-agents-pkgs.codex
    llm-agents-pkgs.opencode
    llm-agents-pkgs.tuicr
  ];
}
