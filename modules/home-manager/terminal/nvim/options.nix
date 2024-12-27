{user, ...}: {
programs.nixvim= {
   globals.mapleader = " ";

  opts = {
    number = true;
    relativenumber = true;

    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;

    smartindent = true;

    wrap = false;

    swapfile = false;
    backup = false;
    undodir = "/home/${user}/.config/.nvim/undodir";
    undofile = true;

    hlsearch = false;
    incsearch = true;

    scrolloff = 8;
    signcolumn = "yes";

    updatetime = 50;

    colorcolumn = "100";

    mouse = "a";
  };
  highlight.NORMAL.ctermbg= "NONE";
};
}
