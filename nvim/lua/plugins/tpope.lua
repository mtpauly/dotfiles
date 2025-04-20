return {
    {
      'tpope/vim-fugitive',
      config = function()
	vim.keymap.set('n', '<leader>gs', '<cmd>0G<cr>', { noremap = true })
	vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', { noremap = true })
	vim.keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', { noremap = true })
	vim.keymap.set('n', '<leader>gl', '<cmd>0G log --stat --max-count=100<cr>', { noremap = true })
	vim.keymap.set('n', '<leader>gf', '<cmd>0G log -p --max-count=100 %<cr>', { noremap = true })
	vim.keymap.set('x', '<leader>go', '<cmd>.GBrowse!<cr>', opts)
      end,
    },
    { 'tpope/vim-rhubarb' },
    { 'tpope/vim-surround' },
}


