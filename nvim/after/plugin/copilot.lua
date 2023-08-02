vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- TODO: this is not correctly disabling tab
-- possible is has something to do with tab not being unbound in completions

-- start disabled
-- TODO:

-- vim.api.nvim_set_keymap(
--     "n",
--     "<space>cs",
--     ":Copilot status<CR>",
--     { noremap = true }
-- )
--
-- vim.api.nvim_set_keymap(
--     "n",
--     "<space>cp",
--     ":Copilot panel<CR>",
--     { noremap = true }
-- )
--
-- vim.api.nvim_set_keymap(
--     "n",
--     "<space>cd",
--     ":Copilot disable<CR>",
--     { noremap = true }
-- )
--
-- vim.api.nvim_set_keymap(
--     "n",
--     "<space>ce",
--     ":Copilot enable<CR>",
--     { noremap = true }
-- )

