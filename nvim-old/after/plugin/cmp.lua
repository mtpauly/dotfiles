-- manage code suggestion format
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/autocomplete.md#introduction
-- TODO: show suggestions when instantiating a class or calling a function
cmp.setup({
    mapping = {
        -- suggestion navigation
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
        ['<C-y>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp_action.luasnip_jump_forward(),
        ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    },

    -- TODO: order the sources such that lsp comes first in the suggestions (currently doesn't always)
    -- TODO: just think about which of these is really relevant
    sources = {
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'nvim_lsp_signature_help' },
        -- { name = 'nvim_lua' , keyword_length = 2 },
        -- { name = 'buffer', keyword_length = 2 },
        -- { name = 'path' },
        -- { name = 'luasnip', show_autosnippets = true },
        -- { name = 'vsnip', keyword_length = 2 },
    },

    -- TODO: why is this not working?? print statements not showing up...
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            print('running formatting function...')
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                nvim_lua = 'Π',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },

    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})
