{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
    };

    shellAliases = {
      fuck = "sudo !!";
      cat = "bat --plain --pager=none";
      ls = "lsd";
      lg = "lazygit";
      p = "pnpm";
      g = "git";
      c = "clear";
      dust = "dust -r";
      hm = "nix run '.#homeConfigurations.tasky.activationPackage'";
    };

    initContent = ''
      bindkey -v
      setopt autocd extendedglob nomatch notify
      setopt HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS
      setopt INC_APPEND_HISTORY SHARE_HISTORY
      unsetopt beep

      bindkey '^R' history-incremental-search-backward
      bindkey '^S' history-incremental-search-forward

      bindkey '^k' autosuggest-accept
      bindkey '^e' autosuggest-toggle

      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"

      # Load secrets if available
      [ -f ~/.secrets/anthropic.env ] && source ~/.secrets/anthropic.env

      # fzf-tab config
      zstyle ':fzf-tab:complete:(-command-|-parameter-|-redirect-|sudo|man):*' fzf-preview 'less +F "$realpath"'
    '';
  };
}
