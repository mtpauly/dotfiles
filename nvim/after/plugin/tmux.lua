local tmux = require('tmux')

tmux.setup({
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
})

-- keybinds for navigation
vim.keymap.set('n', '<C-Space>k', tmux.move_top, {})
vim.keymap.set('n', '<C-Space>j', tmux.move_bottom, {})
vim.keymap.set('n', '<C-Space>h', tmux.move_left, {})
vim.keymap.set('n', '<C-Space>l', tmux.move_right, {})

-- keybinds for resizing
vim.keymap.set('n', '<C-Space><C-k>', tmux.resize_top, {})
vim.keymap.set('n', '<C-Space><C-j>', tmux.resize_bottom, {})
vim.keymap.set('n', '<C-Space><C-h>', tmux.resize_left, {})
vim.keymap.set('n', '<C-Space><C-l>', tmux.resize_right, {})

