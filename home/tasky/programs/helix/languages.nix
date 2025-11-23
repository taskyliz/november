{ ... }:

{
  programs.helix.languages = {
    language-server.typescript-language-server = {
      command = "typescript-language-server";
      args = [ "--stdio" ];
      config = {
        hostInfo = "helix";
      };
    };

    language-server.tombi = {
      command = "tombi";
    };

    language-server.nil = {
      command = "nil";
    };

    language = [
      {
        name = "typescript";
        language-servers = [ "typescript-language-server" ];
        auto-format = true;
      }
      {
        name = "tsx";
        language-servers = [ "typescript-language-server" ];
        auto-format = true;
      }
      {
        name = "javascript";
        language-servers = [ "typescript-language-server" ];
        auto-format = true;
      }
      {
        name = "jsx";
        language-servers = [ "typescript-language-server" ];
        auto-format = true;
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
