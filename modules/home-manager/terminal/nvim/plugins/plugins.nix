{pkgs, ...}: {
imports = [
  ./lsp.nix
  ./telescope.nix
  ./cmp.nix
  ./treesitter.nix
  ./undotree.nix
  ./yazi.nix
  ./markdown.nix
  ./onedark.nix
];
programs.nixvim = { 
    plugins = {
        dap = {
            enable = true;
            adapters = {
                executables = {
                    command = "gdb";
                    name = "cppdbg";
                };
            };
            extensions = {
                dap-python.enable = true;
            };
        };

        copilot-vim = {
            enable = true;
            settings = {
                workspace_folders = [
                "~/sandbox/gs_script/"
                "~/.config/nixos/"
                "~/sandbox/webglMath/"
                ];
            };
        };

# Icons 
        web-devicons.enable = true;

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

        tmux-navigator = {
            enable = true;
            keymaps = [
            {
                mode = "n";
                action = "left";
                key = "<C-LEFT>";
            }
            {
                mode = "n";
                action = "down";
                key = "<C-DOWN>";
            }
            {
                mode = "n";
                action = "up";
                key = "<C-UP>";
            }
            {
                mode = "n";
                action = "right";
                key = "<C-RIGHT>";
            }
            {
                mode = "n";
                action = "previous";
                key = "<C-p>";
            }
            ];
        };
    };
 

  extraConfigLua = ''
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

