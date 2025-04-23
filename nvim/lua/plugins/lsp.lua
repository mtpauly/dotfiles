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
        lua_ls = {}, -- https://luals.github.io/#neovim-install
        ts_ls = {}, -- https://github.com/typescript-language-server/typescript-language-server?tab=readme-ov-file#installing
        pyright = {}, -- https://github.com/microsoft/pyright/blob/main/docs/installation.md
      }

      for server, config in pairs(servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        require'lspconfig'[server].setup(config)
      end
    end,
  }
}
