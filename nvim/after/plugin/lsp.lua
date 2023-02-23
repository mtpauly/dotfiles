local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'pylsp',
})

lsp.configure('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 1000
                }
            }
        }
    }
})

lsp.setup()

--TODO see primagen's setup
