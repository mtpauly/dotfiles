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
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- "find buffers"
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- "find help"
vim.keymap.set('n', '<leader>fp', builtin.diagnostics, {}) -- "find problems"
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {}) -- "find references"
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {}) -- "find keymaps"
wk.register({
    f = {
        d = 'telescope.builtin.find_files',
        g = 'telescope.builtin.live_grep',
        b = 'telescope.builtin.buffers',
        h = 'telescope.builtin.help_tags',
        p = 'telescope.builtin.diagnostics',
        r = 'telescope.builtin.lsp_references',
        k = 'telescope.builtin.keymaps',
    },
}, { prefix = '<leader>' })

-- searching
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>fG', ':Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set('v', '<space>fG', function()
	local text = vim.getVisualSelection()
	builtin.current_buffer_fuzzy_find({ default_text = text })
end, opts)

vim.keymap.set('n', '<space>fg', ':Telescope live_grep<cr>', opts)
vim.keymap.set('v', '<space>fg', function()
	local text = vim.getVisualSelection()
	builtin.live_grep({ default_text = text })
end, opts)

