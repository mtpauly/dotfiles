require('config.lazy')

-- TODO: where should these go?

vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('', ';', ':', { noremap = true })

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")






-- Open help window in a vertical split to the right
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_right", {}),
  pattern = { "*.txt" },
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.wincmd("L")
    end
  end
})




-- comments
-- fugitive














-- TODO: port other stuff from my old config
