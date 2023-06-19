require('todo-comments').setup({})

vim.api.nvim_set_keymap(
    "n",
    "<space>xt",
    ":TodoTrouble <CR>",
    { noremap = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<space>ft",
    ":TodoTelescope <CR>",
    { noremap = true}
)

