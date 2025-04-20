return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
	  library = {
	    -- See the configuration section for more details
	    -- Load luvit types when the `vim.uv` word is found
	    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	  },
	},
      },
    },
    config = function()
      local servers = {
	lua_ls = {},
      }

      for server, config in pairs(servers) do
	config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
	require'lspconfig'[server].setup(config)
      end
    end,
  }
}
