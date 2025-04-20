return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require'oil'.setup {
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>')
  end,
}
