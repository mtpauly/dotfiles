-- block cursor
vim.opt.guicursor = ""

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- no line wrapping
vim.opt.wrap = false

-- long term undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- nice colors
vim.opt.termguicolors = true

-- keep a border when scrolling
vim.opt.scrolloff = 8

-- keep signcolumn always open
vim.opt.signcolumn = "yes"

-- fast updates
vim.opt.updatetime = 50

-- don't continue comments on the next line
vim.cmd([[autocmd BufEnter,BufNewFile,BufRead * set formatoptions-=cro]])

