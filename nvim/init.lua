-- Map leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Default indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Block cursor
vim.opt.guicursor = ""

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- No wrapping
vim.opt.wrap = false

-- Long term undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Show searches as you go
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Maintain a border when scrolling
vim.opt.scrolloff = 8

-- Keep sign column always open
vim.opt.signcolumn = "yes"

-- Split below and right
vim.o.splitright = true
vim.o.splitbelow = true

-- Smart case for search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use treesitter for code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Set the default textwidth to 100
vim.opt.textwidth = 100

-- Fast vsplit
vim.keymap.set('n', '<leader>m', '<cmd>vsplit<cr>')

-- Use ; as :
vim.keymap.set('', ';', ':', { noremap = true })

-- Center the cursor for common commands
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Diff mode
vim.keymap.set("v", "<leader>do", ":diffget<cr>", { noremap = true })
vim.keymap.set("v", "<leader>dp", ":diffput<cr>", { noremap = true })

-- Delete without copying
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Paste into void register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Don't continue comments on the next line
vim.cmd([[autocmd BufEnter,BufNewFile,BufRead * set formatoptions-=ro]])

-- Open help window in a vertical split to the right
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    vim.cmd.wincmd("L")
  end,
})

-- Quickfix navigation
vim.keymap.set('n', '<leader>qt', function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end, { noremap = true, silent = true })
vim.keymap.set("n", "<c-n>", "<cmd>cnext<CR>", { noremap = true })
vim.keymap.set("n", "<c-p>", "<cmd>cprev<CR>", { noremap = true })

-- Execute lua code
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Source plugins
require('config.lazy')
