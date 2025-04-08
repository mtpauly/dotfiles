local lsp = require('lsp-zero')
local wk = require("which-key")

require('luasnip.loaders.from_vscode').lazy_load()

lsp.preset({
    name = 'recommended',
    set_lsp_keymaps = {
        omit = {'gr'},
    },
    manage_nvim_cmp = {
        set_sources = false,
        set_basic_mappings = false,
        set_extra_mappings = false,
        use_luasnip = true,
    }
})

lsp.on_attach(function(client, bufnr)
    -- https://github.com/ThePrimeagen/init.lua/blob/after/plugin/lsp.lua
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gc", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    wk.register({
        g = {
            d = "vim.lsp.buf.definition()",
            c = "vim.lsp.buf.rename()",
        },
        ["["] = {
            d = "vim.diagnostic.goto_prev()",
        },
        ["]"] = {
            d = "vim.diagnostic.goto_next()",
        },
    })

    require("lsp-inlayhints").on_attach(client, bufnr)
end)

lsp.nvim_workspace() -- Fix Undefined global 'vim'
lsp.skip_server_setup({'jdtls'})
lsp.setup()

vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>')
vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<cr>')
wk.register({
    l = {
        l = 'LspLog',
        i = 'LspInfo',
    },
}, { prefix = '<leader>' })

-- TODO: should this be somewhere else?
-- rust setup
require('lspconfig').rust_analyzer.setup({
    cmd = {
        'rustup', 'run', 'stable', 'rust-analyzer',
    },
})
