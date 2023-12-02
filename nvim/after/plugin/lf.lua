local wk = require('which-key')

-- https://github.com/lmburns/lf.nvim

vim.g.lf_netrw = 1

require("lf").setup({
    escape_quit = false,
    border = "rounded",
    mappings = false,
    winblend = 0,

})

-- start from window root
vim.keymap.set(
    "n",
    "<leader>fl",
    function()
        require("lf").start(vim.fn.getcwd())
    end,
    { noremap = true }
)
-- start from location of current buffer
vim.keymap.set(
    "n",
    "<leader>fj",
    function()
        require("lf").start()
    end,
    { noremap = true }
)
wk.register({
    f = {
        l = 'open lf at session root',
        j = 'open lf at buffer path',
    },
}, { prefix = '<leader>' })
