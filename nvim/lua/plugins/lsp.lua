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
        lua_ls = {},        -- https://luals.github.io/#neovim-install
        ts_ls = {},         -- https://github.com/typescript-language-server/typescript-language-server?tab=readme-ov-file#installing
        pyright = {},       -- https://github.com/microsoft/pyright/blob/main/docs/installation.md
        gopls = {},         -- go install golang.org/x/tools/gopls@latest
        vimls = {},         -- https://github.com/iamcco/vim-language-server
        rust_analyzer = {}, -- https://rust-analyzer.github.io/book/installation.html
        sourcekit = {},     -- https://github.com/swiftlang/sourcekit-lsp
        buf_ls = {},        -- https://github.com/bufbuild/buf
        -- https://github.com/grafana/jsonnet-language-server/releases
        ['jsonnet-language-server'] = {
          cmd = { 'jsonnet-language-server' },
          filetypes = { 'jsonnet' },
          root_markers = { '.git' },
        },
        -- https://github.com/Microsoft/vscode/tree/main/extensions/json-language-features/server#integrate
        ['vscode-json-languageserver'] = {
          cmd = { 'vscode-json-languageserver', '--stdio' },
          filetypes = { 'json' },
        },
      }

      local on_attach = function(client, bufnr)
        -- Automatically format the current buffer on save for specific filetypes
        local auto_format_filetypes = { "lua" }
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              if vim.tbl_contains(auto_format_filetypes, vim.bo[bufnr].filetype) then
                vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
              end
            end,
          })
        end

        -- Set keybinds
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local function with_desc(desc) return vim.tbl_extend("force", opts, { desc = desc }) end

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, with_desc("Go to definition"))
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, with_desc("Go to declaration"))
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, with_desc("Go to type definition"))
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, with_desc("Hover documentation"))
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, with_desc("List references"))
        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, with_desc("Show diagnostics"))

        vim.keymap.set("n", "<leader>li", ":LspInfo<cr>", with_desc("LSP info"))
        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ bufnr = bufnr, id = client.id }) end, with_desc("Format buffer"))

        -- Disable formatexpr. This means gq will use the built-in text formatting for comment
        -- wrapping
        -- NOTE: If LSP formatting is something I want, should setup a new keybind for it
        vim.bo[bufnr].formatexpr = nil
      end

      for server, config in pairs(servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        vim.lsp.config[server] = config
        vim.lsp.enable(server)
      end
    end,
  }
}
