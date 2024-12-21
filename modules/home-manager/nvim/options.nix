{user, ...}: {
programs.nixvim= {
   globals.mapleader = " ";

  globalOpts = {
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

    hlssearch = false;
    incsearch = true;

    scrolloff = 8;
    signcolumn = "yes";

    updatetime = 50;

    colorcolumn = "80";

    mouse = "a";
  };
};
}
