{ ... }:

{
  programs.lazygit = {
    enable = true;

    settings = {
      gui = {
        theme = {
          activeBorderColor = [ "#89b4fa" "bold" ];
          inactiveBorderColor = [ "#a6adc8" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#89b4fa" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" "bold" ];
        };

        showFileTree = true;
        showRootItemInFileTree = false;
        nerdFontsVersion = "3";
        showFileIcons = true;
      };

      git.commitPrefix = [
        {
          pattern = "^(feature|fix|docs|chore|refactor|test|perf|ci|build|revert)\\/(.+)$";
          replace = "[$1/$2] ";
        }
      ];

      customCommands = [
        {
          key = "<c-g>";
          context = "files";
          description = "Conventional Commit (type: subject)";
          prompts = [
            {
              type = "menu";
              title = "Commit type";
              key = "Type";
              options = [
                {
                  name = "feat";
                  value = "feat";
                }
                {
                  name = "fix";
                  value = "fix";
                }
                {
                  name = "docs";
                  value = "docs";
                }
                {
                  name = "style";
                  value = "style";
                }
                {
                  name = "refactor";
                  value = "refactor";
                }
                {
                  name = "test";
                  value = "test";
                }
                {
                  name = "chore";
                  value = "chore";
                }
                {
                  name = "perf";
                  value = "perf";
                }
                {
                  name = "ci";
                  value = "ci";
                }
                {
                  name = "build";
                  value = "build";
                }
                {
                  name = "revert";
                  value = "revert";
                }
              ];
            }
            {
              type = "input";
              title = "Subject";
              key = "Subject";
              initialValue = "";
            }
          ];
          command = "git commit -m \"{{.Form.Type}}: {{.Form.Subject}}\"";
          output = "terminal";
        }
      ];
    };
  };
}
