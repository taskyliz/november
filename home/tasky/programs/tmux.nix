{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # Use Ctrl-a as prefix key (more ergonomic than Ctrl-b)
    prefix = "C-a";

    # Enable mouse support for pane selection, resizing, and scrolling
    mouse = true;

    # Use vi-style keybindings in copy mode
    keyMode = "vi";

    # Start window and pane numbering at 1 instead of 0
    baseIndex = 1;

    # Enable 24-bit true color support
    terminal = "tmux-256color";

    # Increase scrollback buffer size
    historyLimit = 5000000;

    # Faster escape time (better for vim/neovim)
    escapeTime = 0;

    # Enable focus events (useful for vim/neovim)
    focusEvents = true;

    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      # Sensible defaults for tmux
      sensible

      # Yank to system clipboard
      {
        plugin = yank;
        extraConfig = ''
          # Use vi-style copy mode bindings
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        '';
      }

      # Session persistence
      {
        plugin = resurrect;
        extraConfig = ''
          # Restore vim sessions
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'

          # Restore pane contents
          set -g @resurrect-capture-pane-contents 'on'

          # Restore shell history
          set -g @resurrect-save-shell-history 'on'
        '';
      }

      # Auto-save and auto-restore tmux sessions
      {
        plugin = continuum;
        extraConfig = ''
          # Auto-save interval in minutes
          set -g @continuum-save-interval '15'

          # Auto-restore last saved session on tmux start
          set -g @continuum-restore 'on'

          # Show continuum status in status bar
          set -g @continuum-status-formatter 'auto-save: #[fg=green]#{status_timer}#[default]'
        '';
      }

      # Seamless navigation between vim and tmux panes
      vim-tmux-navigator
    ];

    extraConfig = ''
      # Automatically renumber windows when one is closed
      set -g renumber-windows on

      # Reload config file with prefix + r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Split panes with | and - (more intuitive)
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Create new window in current path
      bind c new-window -c "#{pane_current_path}"

      # Quick pane switching with prefix + hjkl (vim-style)
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Resize panes with prefix + HJKL
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Quick window switching with prefix + Ctrl-h/l
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      # Break pane into new window
      bind b break-pane -d

      # Enter copy mode with prefix + [
      bind [ copy-mode

      # Paste with prefix + ]
      bind ] paste-buffer

      # Toggle synchronize-panes (send commands to all panes)
      bind S set-window-option synchronize-panes \; display "Sync: #{?synchronize-panes,ON,OFF}"

      # Update status bar every 5 seconds
      set -g status-interval 5

      # Status bar position
      set -g status-position bottom

      # Status bar colors
      set -g status-style 'bg=#1e1e2e fg=#cdd6f4'

      # Left status: session name
      set -g status-left-length 40
      set -g status-left '#[fg=#89b4fa,bold] #S #[default]│ '

      # Right status
      set -g status-right-length 80
      set -g status-right '#{continuum_status} '

      # Window status format
      set -g window-status-format ' #I:#W#F '
      set -g window-status-current-format '#[fg=#89b4fa,bold] #I:#W#F '

      # Window status separator
      set -g window-status-separator '│'

      # Pane borders
      set -g pane-border-style 'fg=#45475a'
      set -g pane-active-border-style 'fg=#89b4fa'

      # Message style
      set -g message-style 'bg=#89b4fa fg=#1e1e2e bold'

      # Copy mode highlighting
      set -g mode-style 'bg=#89b4fa fg=#1e1e2e'

      # Enable RGB color support
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Advertise E3 (clear scrollback) so CSI 3J works correctly through tmux.
      set -ga terminal-overrides ",*:E3=\E[3J"

      # Enable cursor shape changes in neovim
      set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

      # Enable activity alerts
      setw -g monitor-activity on
      set -g visual-activity off

      # Aggressive resize (useful for multi-monitor setups)
      setw -g aggressive-resize on

      # Don't automatically rename windows
      set -g allow-rename off

      # Enable clipboard integration
      set -g set-clipboard on

      # Amp CLI compatibility
      set -g allow-passthrough all
      set -ga terminal-features ",*:hyperlinks"
      set -s extended-keys on
      set -g extended-keys-format csi-u
    '';
  };
}
