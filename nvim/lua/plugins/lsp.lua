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
        lua_ls = {},  -- https://luals.github.io/#neovim-install
        ts_ls = {},   -- https://github.com/typescript-language-server/typescript-language-server?tab=readme-ov-file#installing
        pyright = {}, -- https://github.com/microsoft/pyright/blob/main/docs/installation.md
        gopls = {},   -- go install golang.org/x/tools/gopls@latest
        vimls = {},   -- https://github.com/iamcco/vim-language-server
      }

      local on_attach = function(client, bufnr)
        -- Format the current buffer on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ bufnr = bufnr, id = client.id }) end,
          })
        end

        -- Set keybinds
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
      end

      for server, config in pairs(servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        require 'lspconfig'[server].setup(config)
      end
    end,
  }
}
