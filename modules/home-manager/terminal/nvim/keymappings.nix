{...}: {
  programs.nixvim = {
  keymaps = [
    
    {
        mode = "n";
        key = "<leader>y";
        action = "<cmd>Ex<cr>";
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

    {
        mode = "v";
        key = "<S-C-c>";
        action = "\"+y";
        options = {
            desc = "wl-copy";
        };
    }

    {
        mode = "i";
        key = "<S-C-v>";
        action = "<C-r>+";
        options = {
            desc = "wl-copy";
        };
    }
    {
        mode = "v";
        key = "<S-C-v>";
        action = "c<ESC>\"+p";
        options = {
            desc = "replace with clipbord";
        };
    }
  ];
};
}
