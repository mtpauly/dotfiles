require('telescope').load_extension('lazygit')

vim.api.nvim_set_keymap(
    "n",
    "<space>gg",
    ":LazyGit<CR>",
    { noremap = true }
)

