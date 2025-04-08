local opts = { noremap = true }

vim.keymap.set('n', '<leader>gs', '<cmd>0G<cr>', opts)
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', opts)
vim.keymap.set('n', '<leader>gdd', '<cmd>0G diff<cr>', opts)
vim.keymap.set('n', '<leader>gds', '<cmd>0G diff --staged<cr>', opts)
vim.keymap.set('n', '<leader>gdv', '<cmd>Gvdiffsplit<cr>', opts)
vim.keymap.set('n', '<leader>gdh', '<cmd>Ghdiffsplit<cr>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>0G log<cr>', opts)
vim.keymap.set('n', '<leader>gp', '<cmd>0G log -p --max-count=10<cr>', opts)
vim.keymap.set('n', '<leader>gf', '<cmd>0G log %<cr>', opts)
vim.keymap.set('n', '<leader>ga', '<cmd>0G branch -a<cr>', opts)
vim.keymap.set('n', '<leader>go', '<cmd>.GBrowse!<cr>', opts)
vim.keymap.set('x', '<leader>go', '<cmd>.GBrowse!<cr>', opts)
