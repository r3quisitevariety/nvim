{
  description = "swag neovim config";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSystem = nixpkgs.lib.genAttrs systems;
    pkgsFor = nixpkgs.legacyPackages;

    toolList = system:
      with pkgsFor.${system}; [
        # basic stuff
        neovim
        fzf
        ripgrep
        fd
        git
        lua
        luarocks
        tree-sitter
        # lsp stuff
        # make sure you have toolchains for go, rust, typst, etc in your system for things to fully work
        # i omitted them here for the sake of minimizing closure size
        lua-language-server
        rust-analyzer
        gopls
        nil
        nixd
        typescript-language-server
        harper
        # formatting stuff
        stylua
        prettier
        nixfmt
        alejandra
        kdlfmt
        # stuff needed for typst-preview.nvim
        typstyle
        tinymist
        websocat
        curl
        xdg-utils
      ];

    toolsEnv = system:
      pkgsFor.${system}.symlinkJoin {
        name = "neovim-dots-tools";
        paths = toolList system;
      };

    nvimConfig = ./.; # the flake root is the nvim config dir

    makeApp = system: name: script: {
      type = "app";
      program = toString (pkgsFor.${system}.writeShellScript name script);
    };
  in {
    apps = forEachSystem (system: rec {
      # default: `nix run github:r3quisitevariety/neovim-dots` -> launches nvim
      default = makeApp system "neovim" ''
        set -e

        nativeXdgConfigHome=''${XDG_CONFIG_HOME:-$HOME/.config}

        # Writable, isolated XDG_CONFIG_HOME so we use the flake's nvim config
        # without touching the user's real ~/.config/nvim. Lazy.nvim will still
        # install plugins to the persistent XDG_DATA_HOME (~/.local/share).
        export XDG_CONFIG_HOME="$(mktemp -d -t neovim-dots.XXXXXX)"
        cp -rL ${nvimConfig} "$XDG_CONFIG_HOME/nvim"
        chmod -R u+w "$XDG_CONFIG_HOME/nvim"

        # Keep native user configuration available while isolating Neovim.
        for config in "$nativeXdgConfigHome"/* "$nativeXdgConfigHome"/.[!.]* "$nativeXdgConfigHome"/..?*; do
          [ -e "$config" ] || [ -L "$config" ] || continue
          name="''${config##*/}"
          [ "$name" = nvim ] && continue
          ln -s "$config" "$XDG_CONFIG_HOME/$name"
        done

        # Put all the LSPs, formatters, and toolchain binaries on PATH.
        export PATH="${toolsEnv system}/bin:$PATH"

        exec nvim "$@"
      '';

      # `nix run github:r3quisitevariety/neovim-dots#shell` -> interactive shell
      shell = makeApp system "neovim-shell" ''
        set -e

        nativeXdgConfigHome=''${XDG_CONFIG_HOME:-$HOME/.config}

        export XDG_CONFIG_HOME="$(mktemp -d -t neovim-dots.XXXXXX)"
        cp -rL ${nvimConfig} "$XDG_CONFIG_HOME/nvim"
        chmod -R u+w "$XDG_CONFIG_HOME/nvim"
        for config in "$nativeXdgConfigHome"/* "$nativeXdgConfigHome"/.[!.]* "$nativeXdgConfigHome"/..?*; do
          [ -e "$config" ] || [ -L "$config" ] || continue
          name="''${config##*/}"
          [ "$name" = nvim ] && continue
          ln -s "$config" "$XDG_CONFIG_HOME/$name"
        done
        export PATH="${toolsEnv system}/bin:$PATH"

        echo "Neovim-dots shell. All LSPs and formatters are on PATH."
        echo "Run \`nvim\` to launch the editor, or \`exit\` to leave."

        exec "''${SHELL:-sh}" -i
      '';
    });

    devShells = forEachSystem (system: {
      default = pkgsFor.${system}.mkShell {
        packages = toolList system;
        shellHook = ''
          export XDG_CONFIG_HOME="$PWD/.config"
          mkdir -p "$XDG_CONFIG_HOME"
          [ -L "$XDG_CONFIG_HOME/nvim" ] || ln -s "$PWD" "$XDG_CONFIG_HOME/nvim"
        '';
      };
    });
  };
}
