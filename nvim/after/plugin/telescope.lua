local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local wk = require('which-key')

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
            },
        },
        -- TODO: figure out how to make this better
        -- doesn't show the directory structure at all
        path_display = {"smart"},
        layout_config = {
            horizontal = {
                width = 0.9,
                preview_cutoff = 60,
            },
        },
    },
}

-- see: https://github.com/nvim-telescope/telescope.nvim#neovim-lsp-pickers
vim.keymap.set('n', '<leader>fd', builtin.find_files, {}) -- "find files"
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- "find grep"
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- "find buffers"
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- "find help"
vim.keymap.set('n', '<leader>fp', builtin.diagnostics, {}) -- "find problems"
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {}) -- "find references" -- TODO: this doesn't appear to be working
wk.register({
    f = {
        d = 'telescope.builtin.find_files',
        g = 'telescope.builtin.live_grep',
        b = 'telescope.builtin.buffers',
        h = 'telescope.builtin.help_tags',
        p = 'telescope.builtin.diagnostics',
        r = 'telescope.builtin.lsp_references',
    },
}, { prefix = '<leader>' })
