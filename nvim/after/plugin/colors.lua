require('ayu').setup({
    overrides = {
        LineNr = {
            fg = '#A6ACAF',
        },
    },
})

require('onedark').setup({
    style = 'darker', -- dark, darker, cool, deep, warm, warmer, light
    toggle_style_key = '<leader>n',
})

-- https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file
-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/colors.lua
-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua
require('kanagawa').setup({
    colors = {
        theme = {
            wave = {
                ui = {
                    bg_dim = '#000000',
                    bg_gutter = '#000000',

                    bg_m3 = '#000000',
                    bg_m2 = '#000000',
                    bg_m1 = '#000000',
                    bg = '#000000',
                    bg_p1 = '#000000',
                    bg_p2 = '#000000',

                    -- bg_search = '#000000',
                    -- bg_visual = '#000000',
                    --
                    -- pmenu = {
                    --     bg = '#000000',
                    --     bg_sel = '#000000',
                    --     bg_sbar = '#000000',
                    --     bg_thumb = '#000000',
                    -- },
                    --
                    -- float = {
                    --     bg = '#000000',
                    --     bg_border = '#000000',
                    -- },
                },

                diff = {
                    change = "#000000",
                },
            },

            dragon = {
                ui = {
                    bg_dim = '#000000',
                    bg_gutter = '#000000',

                    bg_m3 = '#000000',
                    bg_m2 = '#000000',
                    bg_m1 = '#000000',
                    bg = '#000000',
                    bg_p1 = '#000000',
                    bg_p2 = '#000000',
                },

                diff = {
                    change = "#000000",
                },
            },
        },
    },
})

vim.cmd.colorscheme('kanagawa')
