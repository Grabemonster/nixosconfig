{...}: {
  programs.nixvim = {
  keymaps = [
    
    {
        mode = "n";
        key = "<leader>y";
        action = "<cmd>Ex<cr>";
    }

    {
        mode = "n";
        key = "<C-LEFT>";
        action = "<C-w><left>";
    }
    {
        mode = "n";
        key = "<C-RIGHT>";
        action = "<C-w><right>";
    }
    {
        mode = "n";
        key = "<C-UP>";
        action = "<C-w><up>";
    }
    {
        mode = "n";
        key = "<C-DOWN>";
        action = "<C-w><down>";
    }

    # Bufferline bindings
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }
  ];
};
}
