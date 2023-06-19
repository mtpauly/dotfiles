local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
local buildin = require('telescope.builtin')

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
        path_display = {"smart"},
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
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

require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>fd', buildin.find_files, {})
vim.keymap.set('n', '<leader>fg', buildin.live_grep, {})
vim.keymap.set('n', '<leader>fb', buildin.buffers, {})
vim.keymap.set('n', '<leader>fh', buildin.help_tags, {})

