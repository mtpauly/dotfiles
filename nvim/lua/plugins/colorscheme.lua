return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "moon",
      on_colors = function(colors)
        colors.bg = "#000000"
        colors.bg_dark = "#000000"
        colors.bg_dark1 = "#000000"
        colors.bg_float = "#000000"
        -- colors.bg_highlight = "#000000"
        colors.bg_popup = "#000000"
        -- colors.bg_search = "#000000"
        colors.bg_sidebar = "#000000"
        colors.bg_statusline = "#000000"
        -- colors.bg_visual = "#000000"
      end,
    })
    vim.cmd[[colorscheme tokyonight]]
  end
}
