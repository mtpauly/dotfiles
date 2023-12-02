local ih = require('lsp-inlayhints')
local wk = require('which-key')

-- https://github.com/lvimuser/lsp-inlayhints.nvim#default-configuration
ih.setup()

-- keybinds
vim.keymap.set('n', '<leader>it', function() ih.toggle() end, { remap = false })
vim.keymap.set('n', '<leader>ir', function() ih.reset() end, { remap = false })

wk.register({
    i = {
        t = 'lsp-inlayhints.toggle()',
        r = 'lsp-inlayhints.reset()',
    },
}, { prefix = '<leader>' })
