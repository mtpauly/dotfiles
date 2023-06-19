vim.api.nvim_set_keymap(
    "n",
    "<space>fl",
    ":Telescope file_browser<CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<space>fj",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

