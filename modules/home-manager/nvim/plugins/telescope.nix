{...}:
{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
          };
        };
      };
    };
    keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<S-S>";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = "<leader>ch";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
    }
    ];
  };
 }
