{ ... }:

{
  programs.helix.settings.keys.select = {
    # Muscle memory
    "{" = [
      "extend_to_line_bounds"
      "goto_prev_paragraph"
    ];
    "}" = [
      "extend_to_line_bounds"
      "goto_next_paragraph"
    ];
    "0" = "goto_line_start";
    "$" = "goto_line_end";
    "^" = "goto_first_nonwhitespace";
    G = "goto_file_end";
    D = [
      "extend_to_line_bounds"
      "delete_selection"
      "normal_mode"
    ];
    C = [
      "goto_line_start"
      "extend_to_line_bounds"
      "change_selection"
    ];
    "%" = "match_brackets";
    S = "surround_add";
    u = [
      "switch_to_lowercase"
      "collapse_selection"
      "normal_mode"
    ];
    U = [
      "switch_to_uppercase"
      "collapse_selection"
      "normal_mode"
    ];

    # Visual-mode specific muscle memory
    i = "select_textobject_inner";
    a = "select_textobject_around";

    # Some extra binds to allow us to insert/append in select mode because it's nice with multiple cursors
    tab = [
      "insert_mode"
      "collapse_selection"
    ];
    C-a = [
      "append_mode"
      "collapse_selection"
    ];

    # Make selecting lines in visual mode behave sensibly
    k = [
      "extend_line_up"
      "extend_to_line_bounds"
    ];
    j = [
      "extend_line_down"
      "extend_to_line_bounds"
    ];

    # Clipboards over registers ye ye
    d = [
      "yank_main_selection_to_clipboard"
      "delete_selection"
    ];
    x = [
      "yank_main_selection_to_clipboard"
      "delete_selection"
    ];
    y = [
      "yank_main_selection_to_clipboard"
      "normal_mode"
      "flip_selections"
      "collapse_selection"
    ];
    Y = [
      "extend_to_line_bounds"
      "yank_main_selection_to_clipboard"
      "goto_line_start"
      "collapse_selection"
      "normal_mode"
    ];
    p = "replace_selections_with_clipboard";
    P = "paste_clipboard_before";

    # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
    esc = [
      "collapse_selection"
      "keep_primary_selection"
      "normal_mode"
    ];
  };
}
