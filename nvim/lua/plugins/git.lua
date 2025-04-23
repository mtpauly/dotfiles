return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', '<cmd>0G<cr>', { noremap = true })
      vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', { noremap = true })
      vim.keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', { noremap = true })
      vim.keymap.set('n', '<leader>gl', '<cmd>0G log --stat --max-count=100<cr>', { noremap = true })
      vim.keymap.set('n', '<leader>gf', '<cmd>0G log -p --max-count=100 %<cr>', { noremap = true })
      vim.keymap.set('n', '<leader>go', '<cmd>.GBrowse!<cr>', { noremap = true })
    end,
  },
  { 'tpope/vim-rhubarb' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '-' },
          topdelete = { text = '-' },
          changedelete = { text = '~' },
          untracked = { text = '+' },
        },
      })
    end
  },
}
