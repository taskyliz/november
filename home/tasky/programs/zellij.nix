{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      # UI behavior
      default_mode = "normal";
      default_layout = "compact";
      pane_frame = false;
      mouse_mode = true;
      on_force_close = "quit";

      # Scrollback buffer
      scroll_buffer_size = 5000000;

      # Copy to system clipboard automatically
      copy_on_select = true;
      copy_command = "xclip -selection clipboard";

      # Color theme (Catppuccin Mocha)
      theme = "catppuccin-mocha";

      # UI rendering
      ui = {
        pane_frame = {
          rounded_corners = true;
          hide_session_name = false;
        };
      };

    };
  };
}
