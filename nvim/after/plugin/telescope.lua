local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
local builtin = require('telescope.builtin')

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
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                -- TODO: setup mappings for copy and paste
                ["i"] = {
                    ["<C-n>"] = fb_actions.create,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-m>"] = fb_actions.move,
                    ["<C-x>"] = fb_actions.remove,
                    ["<C-h>"] = fb_actions.backspace,
                    ["<C-l>"] = actions.select_default,
                    ["<CR>"] = actions.select_default,
                },
                ["n"] = {
                    ["<C-n>"] = fb_actions.create,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-m>"] = fb_actions.move,
                    ["<C-x>"] = fb_actions.remove,
                    ["<C-h>"] = fb_actions.backspace,
                    ["<C-l>"] = actions.select_default,
                    ["<CR>"] = actions.select_default,
                },
            }
        }
    }
}
-- TODO: when opening in a horizontal or vertical split we should have the opened window be to the right or bottom

-- TODO: the file browser should start with the first item selected (rather than '..')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

