{ ... }:

{
  programs.helix.settings.keys.normal = {
    # Quick iteration on config changes
    C-o = ":config-open";
    C-r = ":config-reload";

    # Lazygit integration
    C-g = [
      ":write-all"
      ":new"
      ":insert-output lazygit"
      ":buffer-close!"
      ":redraw"
      ":reload-all"
    ];

    # Some nice Helix stuff
    C-h = "select_prev_sibling";
    C-j = "shrink_selection";
    C-k = "expand_selection";
    C-l = "select_next_sibling";

    # Personal preference
    o = [
      "open_below"
      "normal_mode"
    ];
    O = [
      "open_above"
      "normal_mode"
    ];

    # Muscle memory
    "{" = [
      "goto_prev_paragraph"
      "collapse_selection"
    ];
    "}" = [
      "goto_next_paragraph"
      "collapse_selection"
    ];
    "0" = "goto_line_start";
    "$" = "goto_line_end";
    "^" = "goto_first_nonwhitespace";
    G = "goto_file_end";
    "%" = "match_brackets";
    V = [
      "select_mode"
      "extend_to_line_bounds"
    ];
    C = [
      "extend_to_line_end"
      "yank_main_selection_to_clipboard"
      "delete_selection"
      "insert_mode"
    ];
    D = [
      "extend_to_line_end"
      "yank_main_selection_to_clipboard"
      "delete_selection"
    ];
    S = "surround_add";

    # Clipboards over registers ye ye
    x = "delete_selection";
    p = [
      "paste_clipboard_after"
      "collapse_selection"
    ];
    P = [
      "paste_clipboard_before"
      "collapse_selection"
    ];
    Y = [
      "extend_to_line_end"
      "yank_main_selection_to_clipboard"
      "collapse_selection"
    ];

    # Uncanny valley stuff, this makes w and b behave as they do Vim
    w = [
      "move_next_word_start"
      "move_char_right"
      "collapse_selection"
    ];
    W = [
      "move_next_long_word_start"
      "move_char_right"
      "collapse_selection"
    ];
    e = [
      "move_next_word_end"
      "collapse_selection"
    ];
    E = [
      "move_next_long_word_end"
      "collapse_selection"
    ];
    b = [
      "move_prev_word_start"
      "collapse_selection"
    ];
    B = [
      "move_prev_long_word_start"
      "collapse_selection"
    ];

    i = [
      "insert_mode"
      "collapse_selection"
    ];
    a = [
      "append_mode"
      "collapse_selection"
    ];

    # Undoing the 'd' + motion commands restores the selection which is annoying
    u = [
      "undo"
      "collapse_selection"
    ];

    # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
    esc = [
      "collapse_selection"
      "keep_primary_selection"
    ];

    d = {
      d = [
        "extend_to_line_bounds"
        "yank_main_selection_to_clipboard"
        "delete_selection"
      ];
      t = [ "extend_till_char" ];
      s = [ "surround_delete" ];
      i = [ "select_textobject_inner" ];
      a = [ "select_textobject_around" ];
      j = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_below"
        "yank_main_selection_to_clipboard"
        "delete_selection"
        "normal_mode"
      ];
      down = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_below"
        "yank_main_selection_to_clipboard"
        "delete_selection"
        "normal_mode"
      ];
      k = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_above"
        "yank_main_selection_to_clipboard"
        "delete_selection"
        "normal_mode"
      ];
      up = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_above"
        "yank_main_selection_to_clipboard"
        "delete_selection"
        "normal_mode"
      ];
      G = [
        "select_mode"
        "extend_to_line_bounds"
        "goto_last_line"
        "extend_to_line_bounds"
        "yank_main_selection_to_clipboard"
        "delete_selection"
        "normal_mode"
      ];
      w = [
        "move_next_word_start"
        "yank_main_selection_to_clipboard"
        "delete_selection"
      ];
      W = [
        "move_next_long_word_start"
        "yank_main_selection_to_clipboard"
        "delete_selection"
      ];
      g = {
        g = [
          "select_mode"
          "extend_to_line_bounds"
          "goto_file_start"
          "extend_to_line_bounds"
          "yank_main_selection_to_clipboard"
          "delete_selection"
          "normal_mode"
        ];
      };
    };

    y = {
      y = [
        "extend_to_line_bounds"
        "yank_main_selection_to_clipboard"
        "normal_mode"
        "collapse_selection"
      ];
      j = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_below"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      down = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_below"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      k = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_above"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      up = [
        "select_mode"
        "extend_to_line_bounds"
        "extend_line_above"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      G = [
        "select_mode"
        "extend_to_line_bounds"
        "goto_last_line"
        "extend_to_line_bounds"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      w = [
        "move_next_word_start"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      W = [
        "move_next_long_word_start"
        "yank_main_selection_to_clipboard"
        "collapse_selection"
        "normal_mode"
      ];
      g = {
        g = [
          "select_mode"
          "extend_to_line_bounds"
          "goto_file_start"
          "extend_to_line_bounds"
          "yank_main_selection_to_clipboard"
          "collapse_selection"
          "normal_mode"
        ];
      };
    };
  };
}
