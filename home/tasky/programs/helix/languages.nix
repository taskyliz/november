{ ... }:

{
  programs.helix.languages = {
    language-server.typescript-language-server = {
      command = "typescript-language-server";
      args = [ "--stdio" ];
      config = {
        hostInfo = "helix";
        plugins = [
          {
            name = "@vue/typescript-plugin";
            location = "@vue/language-server";
            languages = [ "vue" ];
          }
        ];
      };
    };

    language-server.tombi = {
      command = "tombi";
    };

    language-server.nil = {
      command = "nil";
    };

    language-server.vue-language-server = {
      command = "@vue/language-server";
      args = [ "--stdio" ];
    };

    language-server.vscode-html-language-server = {
      command = "vscode-html-language-server";
      args = [ "--stdio" ];
    };

    language-server.vscode-css-language-server = {
      command = "vscode-css-language-server";
      args = [ "--stdio" ];
    };

    language = [
      {
        name = "typescript";
        file-types = [ "ts" "tsx" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "typescript" ];
        };
        scope = "source.typescript";
      }
      {
        name = "javascript";
        file-types = [ "js" "jsx" "mjs" "cjs" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "typescript" ];
        };
        scope = "source.javascript";
      }
      {
        name = "css";
        file-types = [ "css" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "css" ];
        };
        scope = "source.css";
      }
      {
        name = "scss";
        file-types = [ "scss" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "scss" ];
        };
        scope = "source.scss";
      }
      {
        name = "less";
        file-types = [ "less" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "less" ];
        };
        scope = "source.less";
      }
      {
        name = "html";
        file-types = [ "html" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "html" ];
        };
        scope = "source.html";
      }
      {
        name = "json";
        file-types = [ "json" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "json" ];
        };
        scope = "source.json";
      }
      {
        name = "yaml";
        file-types = [ "yaml" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "yaml" ];
        };
        scope = "source.yaml";
      }
      {
        name = "markdown";
        file-types = [ "md" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "markdown" ];
        };
        scope = "source.markdown";
      }
      {
        name = "vue";
        file-types = [ "vue" ];
        auto-format = true;
        formatter = {
          command = "prettier";
          args = [ "--parser" "vue" ];
        };
        language-servers = [ "vue-language-server" "typescript-language-server" "vscode-html-language-server" "vscode-css-language-server" ];
        scope = "source.vue";
      }
      {
        name = "toml";
        language-servers = [ "tombi" ];
        auto-format = true;
      }
      {
        name = "nix";
        language-servers = [ "nil" ];
        auto-format = true;
        formatter = {
          command = "nixfmt";
        };
      }
    ];
  };
}
