require("config.set")
require("config.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- plugins

    --{ 'catppuccin/nvim', priority = 1000, },
    --{ 'Shatur/neovim-ayu', priority = 1000, },
    --{ 'folke/tokyonight.nvim', priority = 1000, },
    -- TODO: figure out why there are weird/mixed background colors sometimes
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme('kanagawa-wave')
        end,
    },
    { 'nvim-lualine/lualine.nvim' },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-tree/nvim-web-devicons' },
    { 'ThePrimeagen/harpoon' },

    { 'tpope/vim-surround' },
    { 'tpope/vim-fugitive' },
    { 'mbbill/undotree' },
    { 'lewis6991/gitsigns.nvim' },

    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
        end,
        opts = {}
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    { 'mfussenegger/nvim-jdtls' },

    { 'eandrju/cellular-automaton.nvim' },

    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim", },
    },

    { "aserowy/tmux.nvim" },
    { "github/copilot.vim" },
    { "chentoast/marks.nvim" },

    -- TODO: configure code folding (i think treesitter can do this and other code things)
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- https://github.com/nvim-treesitter/nvim-treesitter#folding
    -- https://github.com/nvim-lua/kickstart.nvim/blob/8064bb63c5ec973bcd8e114c2984475a77981465/init.lua#L307 
    -- TODO: key for commenting lines
}, {
    -- options
    defaults = {
        lazy = false,
        version = false,
    }
})

