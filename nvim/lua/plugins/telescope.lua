return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      defaults = {
	mappings = {
	  i = {
	    ["<C-j>"] = "move_selection_next",
	    ["<C-k>"] = "move_selection_previous",
	  },
	},
      },
      pickers = {
	find_files = {
	  theme = "ivy"
	},
	help_tags = {
	  theme = "ivy"
	},
      },
      extensions = {
	fzf = {},
      }
    }

    -- Load the native fzf extension
    require'telescope'.load_extension'fzf'

    vim.keymap.set('n', '<leader>fd', require('telescope.builtin').find_files)
    vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)

    -- TODO:
  end
}
