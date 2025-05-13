return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = function() return 1000 end,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
