{pkgs, ...}: {
imports = [
  ./lsp.nix
  ./telescope.nix
  ./cmp.nix
  ./treesitter.nix
  ./undotree.nix
];
programs.nixvim = { 
 plugins = { 
    
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

    local double_shift_timer = nil

vim.api.nvim_set_keymap("n", "<S-S>", "", {
    callback = function()
        if double_shift_timer then
            -- Doppel-Shift erkannt
            double_shift_timer:stop()
            double_shift_timer = nil
            print("Doppel-Shift erkannt!")
        else
            -- Erster Shift-Druck
            double_shift_timer = vim.defer_fn(function()
                double_shift_timer = nil
            end, 500) -- 500ms Timeout für den zweiten Druck
        end
    end,
    noremap = true,
    silent = true,
})
  ''; 
  };
}

