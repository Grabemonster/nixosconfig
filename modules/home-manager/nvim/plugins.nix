{pkgs, ...}: {
programs.nixvim = { 
 plugins = {
    

    
    
    
    
    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };

    # Icons 
    web-devicons.enable = true;

    
    
    
    none-ls = {
      enable = true;
      settings = {
        cmd = ["bash -c nvim"];
        debug = true;
      };
      sources = {
        code_actions = {
          statix.enable = true;
          gitsigns.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          pylint.enable = true;
          checkstyle.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          shfmt.enable = true;
          nixpkgs_fmt.enable = true;
          google_java_format.enable = false;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
          black = {
            enable = true;
            settings = ''
              {
                extra_args = { "--fast" },
              }
            '';

          };
        };
        completion = {        
          spell.enable = true;
        };
      };
    };

    
    
        # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Todo comments
    todo-comments = {
      enable = true;
      settings.colors = {
        error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        info = ["DiagnosticInfo" "#2563EB"];
        hint = ["DiagnosticHint" "#10B981"];
        default = ["Identifier" "#7C3AED"];
        test = ["Identifier" "#FF00FF"];
      };
    };

    
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

   
    # Language server
    lsp = {
      enable = true;
      servers = {
        # Average webdev LSPs
        # ts-ls.enable = true; # TS/JS
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        bashls.enable = true; # Bash
        yamlls.enable = true; # YAML
        ltex = {
          enable = true;
          settings = {
            enabled = [ "astro" "html" "latex" "markdown" "text" "tex" "gitcommit" ];
            completionEnabled = true;
            language = "en-US de-DE nl";
            # dictionary = {
            #   "nl-NL" = [
            #     ":/home/liv/.local/share/nvim/ltex/nl-NL.txt"
            #   ];
            #   "en-US" = [
            #     ":/home/liv/.local/share/nvim/ltex/en-US.txt"
            #   ];
            #   "de-DE" = [
            #     ":/home/liv/.local/share/nvim/ltex/de-DE.txt"
            #   ];
            # };
          };
        };
        gopls = { # Golang
          enable = true;
          autostart = true;
        };

        lua_ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };



    
    cmp-emoji = {
      enable = true;
    };

    cmp = {
      enable = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          # { name = "copilot"; } # enable/disable copilot
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    }; 



    schemastore = {
      enable = true;
      yaml.enable = true;
      json.enable = false;
    };

    
  };

  extraConfigVim = ''
  '';

  extraConfigLuaPre = ''
    if vim.g.have_nerd_font then
      require('nvim-web-devicons').setup {}
    end
  '';

  extraConfigLuaPost = ''
    -- vim: ts=2 sts=2 sw=2 et
  '';

  extraConfigLua = ''
    require("telescope")

    kind_icons = {
      Text = "󰊄",
      Method = "",
      Function = "󰡱",
      Constructor = "",
      Field = "",
      Variable = "󱀍",
      Class = "",
      Interface = "",
      Module = "󰕳",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    } 

    local cmp = require'cmp'

  ''; 
};
}

