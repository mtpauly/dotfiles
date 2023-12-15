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
            accept = "<C-f>",
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

local wk = require("which-key")
vim.api.nvim_set_keymap("n", "<leader>cs", ":Copilot status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true })
wk.register({
    s = ":Copilot status",
    p = ":Copilot panel",
    d = ":Copilot disable",
    e = ":Copilot enable",
}, { prefix = "<leader>c" })
