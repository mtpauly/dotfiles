local wk = require('which-key')

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, opts)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, opts)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, opts)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, opts)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, opts)
vim.keymap.set("n", "gr", function() require("trouble").open("lsp_references") end, opts)
wk.register({
    x = {
        x = 'trouble.toggle()',
        w = 'trouble.open(workspace_diagnostics)',
        d = 'trouble.open(document_diagnostics)',
        q = 'trouble.open(quickfix)',
        l = 'trouble.open(loclist)',
    },
}, { prefix = '<leader>' })
wk.register({
    g = {
        r = 'trouble.open(lsp_references)',
    },
})
