local present, lualine = pcall(require, "lualine")
if not present then
    error("STATUSLINE.LUA: Lualine not present!")
    return false
end

local function set_sep()
    return {
        { " ", " " },
        { "", "" },
    }
end


local smolThings = {
    sections = {
        lualine_a = { 'mode' },
        lualine_z = { 'winnr' }
    },

    filetypes = {'CHADTree', 'fern', 'NvimTree'}
}

local config = {
    options = {
        theme = "material",
        section_separators = set_sep()[1],
        component_separators = set_sep()[2],
        disabled_filetypes = {},
    },

    sections = {
        lualine_a = { "winnr", "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            "filename",
            {
                "diagnostics",
                sources = {'nvim_lsp'}
            }
        },
        lualine_x = {
            { "diff" },
            "encoding",
            "fileformat",
            {
                "filetype",
                colored = false,
            },
        },
        lualine_y = {
            "progress"
        },
        lualine_z = {
            "location",
        },
    },

    inactive_sections = {
        lualine_a = { "winnr" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },

    extensions = {smolThings},
}

lualine.setup(config)
