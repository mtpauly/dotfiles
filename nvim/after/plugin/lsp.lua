local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.preset('recommended')
lsp.nvim_workspace() -- Fix Undefined global 'vim'

lsp.on_attach(function(client, bufnr)
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts
    lsp.default_keymaps({buffer = bufnr})

    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- https://github.com/ThePrimeagen/init.lua/blob/after/plugin/lsp.lua

    -- TODO: goto def (gd) should do center the screen (zz) after
end)

vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>')
vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<cr>')

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/autocomplete.md#introduction
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- TODO: figure out why these are not being unbound
        -- prime does something a little bit different
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    },
})

lsp.setup()

-- TODO: there should be some way to check for imports on an existing token (some button to open the lsp window)

