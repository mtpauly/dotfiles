local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
-- TODO: figure out how to get this to work
vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-2>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-3>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-4>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-5>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-6>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-7>", function() ui.nav_file(1) end)

-- TODO: need to rebind draw screen to <leader> <C-l>
-- or do this through tmux (?)

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 8,
    }
})

