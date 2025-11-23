{ ... }:

{
  programs.helix.settings.keys.insert = {
    # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
    esc = [
      "collapse_selection"
      "normal_mode"
    ];
  };
}
