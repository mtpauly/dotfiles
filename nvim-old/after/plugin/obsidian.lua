require("obsidian").setup({
    workspaces = {
        {
            name = "vault",
            path = "~/vault",
            -- overrides = {
            --     notes_subdir = "notes",
            -- },
        },
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
    mappings = {
        ["gd"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
    },
    ui = {
        enable = false,
    },
    notes_subdir = "",
    new_notes_location = "notes_subdir",

    ---@param title string|?
    ---@return string
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return os.date("%Y%m%d%H%M") .. "-" .. suffix
    end,

    ---@return table
    note_frontmatter_func = function(note)
        if note.title then
            note:add_alias(note.title)
        end

        local year = note.id:sub(1, 4)
        local month = note.id:sub(5, 6)
        local day = note.id:sub(7, 8)
        local hour = note.id:sub(9, 10)
        local minute = note.id:sub(11, 12)
        local cdate = string.format("%s-%s-%s %s:%s", year, month, day, hour, minute)

        local out = { id = note.id, cdate = cdate, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
                out[k] = v
            end
        end

        return out
    end,

})

vim.keymap.set('n', '<leader>n', ':ObsidianNew ', { noremap = true })

