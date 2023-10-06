require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
            jump_prev = "<C-p>",
            jump_next = "<C-n>",
            accept = "<C-y>",
        },
        layout = {
            position = "right",
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            prev = "<C-p>",
            next = "<C-n>",
            accept = "<C-y>",
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
    },
})

vim.cmd("silent Copilot disable") -- start disabled

vim.api.nvim_set_keymap("n", "<space>cs", ":Copilot status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>cp", ":Copilot panel<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>cd", ":Copilot disable<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>ce", ":Copilot enable<CR>", { noremap = true })
