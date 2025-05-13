return {
  {
    'tpope/vim-fugitive',
    config = function()
      -- Open gitcommit in vertical split
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'gitcommit',
        callback = function()
          vim.cmd.wincmd("L")
        end,
      })

      -- Open files from fugitive in vertical split
      vim.api.nvim_create_autocmd('BufWinEnter', {
        callback = function()
          local prev_ft = vim.fn.getbufvar('#', '&filetype')
          if prev_ft == 'fugitive' then
            vim.cmd.wincmd("L")
          end
        end,
      })

      -- Set keybinds
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
