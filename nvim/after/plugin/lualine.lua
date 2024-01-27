require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'filename',
                newfile_status = true,
                path = 1,
            },
        },
        lualine_c = {
            {
                'diff',
                source = function ()
                    local status_dict = vim.b.gitsigns_status_dict
                    if status_dict then
                        status_dict.modified = status_dict.changed
                    end
                    return status_dict
                end
            },
            'diagnostics'
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {
            {
                'location',
                padding = 0,
            },
            '%L',
    }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            {
                'filename',
                newfile_status = true,
                path = 1,
            },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

