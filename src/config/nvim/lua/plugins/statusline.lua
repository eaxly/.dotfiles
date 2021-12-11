local lualine = require("lualine")

local function window()
	return vim.api.nvim_win_get_number(0)
end

local function set_sep()
	local M = {}
	M.section = { left = "", right = "" }
	M.component = { left = "|", right = "|" }

	return M
end

local smolThings = {
	sections = {
		lualine_a = {
            {
                "mode",
                separator = { left = set_sep().section.right, right = set_sep().section.left },
                right_padding = 2,
            },
        },
		lualine_z = {
            {
                window,
                separator = { right = set_sep().section.left, left = set_sep().section.right },
                left_padding = 2,
            },
        },
	},

	filetypes = { "CHADTree", "fern", "NvimTree" },
}

local alpha = {
	sections = {
        lualine_a = {
            {
                require("utils").drama_quotes,
                separator = { right = set_sep().section.left, left = set_sep().section.right },
                left_padding = 2,
            },
        },
        lualine_z = {
            {
                window,
                separator = { right = set_sep().section.left, left = set_sep().section.right },
                left_padding = 2,
            },
        }
    },
	filetypes = { "alpha" },
}

local config = {
	options = {
		theme = "__[nvim_statusline_name]__", -- rose pine
		section_separators = set_sep().section,
		component_separators = set_sep().component,
		disabled_filetypes = {},
	},

	sections = {
		lualine_a = {
			{
				window,
				separator = { left = set_sep().section.right },
				right_padding = 2,
			},
			{
				"mode",
			},
			{
				"branch",
			},
		},
		lualine_b = {
			{
				"filetype",
				colored = false,
				icon_only = true,
			},
			{
				"filename",
			},
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
			},
		},
		lualine_x = {
			{
				"diff",
			},
		},
		lualine_y = {
			"fileformat",
			"encoding",
		},
		lualine_z = {
			"progress",
			{
				"location",
				separator = { right = set_sep().section.left },
				left_padding = 2,
			},
		},
	},

	inactive_sections = {
		lualine_a = { window },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				"location",
				separator = { right = set_sep().section.left },
				left_padding = 2,
			},
		},
	},

	extensions = { smolThings, alpha },
}

lualine.setup(config)
