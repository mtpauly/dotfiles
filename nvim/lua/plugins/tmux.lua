return {
  "aserowy/tmux.nvim",
  config = function()
    require'tmux'.setup {
      copy_sync = {
	enable = false,
      },
      navigation = {
	enable_default_keybindings = false,
	cycle_navigation = false,
      },
      resize = {
	enable_default_keybindings = false,
      },
    }

    -- Keybinds for navigation
    vim.keymap.set('n', '<C-Space>k', require'tmux'.move_top, {})
    vim.keymap.set('n', '<C-Space>j', require'tmux'.move_bottom, {})
    vim.keymap.set('n', '<C-Space>h', require'tmux'.move_left, {})
    vim.keymap.set('n', '<C-Space>l', require'tmux'.move_right, {})
  end,
}

