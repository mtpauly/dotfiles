return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "bash", "c", "diff", "git_config", "gitcommit", "gitignore",
        "go", "gomod", "gosum", "html", "json", "jsonnet", "lua",
        "make", "markdown", "markdown_inline", "proto", "python",
        "query", "rust", "starlark", "svelte", "tsx", "typescript",
        "vim", "vimdoc", "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
}
