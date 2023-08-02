local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

lsp.preset({
    name = 'recommended',
    manage_nvim_cmp = {
        set_sources = false,
        set_basic_mappings = false,
        set_extra_mappings = false,
        use_luasnip = true,
    }
})

lsp.on_attach(function(client, bufnr)
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts
    lsp.default_keymaps({buffer = bufnr})

    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- https://github.com/ThePrimeagen/init.lua/blob/after/plugin/lsp.lua
end)

lsp.nvim_workspace() -- Fix Undefined global 'vim'
lsp.skip_server_setup({'jdtls'})
lsp.setup()

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/autocomplete.md#introduction
-- TODO: show suggestions when instantiating a class or calling a function
cmp.setup({
    mapping = {
        ['<C-j>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.complete()
            end
        end),
        ['<C-k>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.complete()
            end
        end),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp_action.luasnip_jump_forward(),
        ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        -- TODO: figure this out
        -- { name = 'copilot' },
        { name = 'path' },
        { name = 'luasnip', show_autosnippets = true },
        { name = 'buffer', keyword_length = 5 },
    },
})

vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>')
vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<cr>')

