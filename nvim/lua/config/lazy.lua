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

    { 'Shatur/neovim-ayu' },
    { 'catppuccin/nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'sainnhe/gruvbox-material' },
    { 'navarasu/onedark.nvim' },
    { 'rose-pine/neovim' },

    { 'nvim-lualine/lualine.nvim' },

    {
        'nvim-telescope/telescope.nvim',
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
    { 'nvim-tree/nvim-web-devicons' },

    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { 'tpope/vim-surround' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'mbbill/undotree' },
    { 'lewis6991/gitsigns.nvim' },
    { "numToStr/Comment.nvim" },
    { "lukas-reineke/indent-blankline.nvim" },

    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            padding = false,
        },
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
        opts = {
            triggers_nowait = {},  -- disable showing marks instantly
        }
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- lsp
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- autocomplete
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
            { "rafamadriz/friendly-snippets" }
        }
    },
    { 'lvimuser/lsp-inlayhints.nvim' },

    -- language-specific plugins
    { 'mfussenegger/nvim-jdtls' },
    -- { 'simrat39/rust-tools.nvim' },

    -- debugging
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui' },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'nvim-telescope/telescope-dap.nvim' },

    { "aserowy/tmux.nvim" },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { 'lervag/vimtex' },

    { 'eandrju/cellular-automaton.nvim' },

    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}, {
    -- options

    defaults = {
        lazy = false,
        version = false,
    }
})

