{ pkgs, llm-agents-pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix
    home-manager
    quickenv
    nixfmt

    # Development
    rustup
    pnpm
    uv
    bun
    nodejs_22
    vite-plus
    go
    zig
    dotnet-sdk_8
    bacon
    kotlin
    kotlin-native
    gradle
    glibc.dev
    (lib.hiPrio llvmPackages_19.clang)
    llvmPackages_19.libclang
    llvmPackages_19.llvm
    sccache
    mold
    buck2
    jdk
    deno
    jujutsu
    lazyjj
    llama-cpp
    delta

    # Profiling & Benchmarking
    hyperfine
    samply
    perf
    heaptrack
    cargo-flamegraph
    cargo-nextest
    valgrind
    bpftrace
    sysstat
    smem
    gnuplot

    # Language Servers
    typescript-language-server
    nil
    zls # Zig Language Server
    ziglint
    zigdoc
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
