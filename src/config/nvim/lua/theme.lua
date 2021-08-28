-- everforest
vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 0
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_virtual_text = "colored"

-- tokyonight
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true

-- rose pine
vim.g.rose_pine_enable_italics = true
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_variant = 'base'

vim.g.nightfox_italic_keywords = true
vim.g.nightfox_italic_comments = true
vim.g.nightfox_style = "duskfox"

-- material
vim.g.material_style = "deep ocean"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true

-- catppuccino
local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "catppuccino",
		transparency = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				styles = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic"
				}
			},
			lsp_trouble = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = false,
			which_key = true,
			indent_blankline = true,
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
		}
	}
)

-- load it
catppuccino.load()

--[[ vim.g.material_custom_colors = {
    bg = "#0c0310",
    bg_alt = "#14051A",
    sidebar = "#14051A"
} ]]
-- setting the theme
-- vim.g.colors_name = "everforest"
-- require("tokyonight").colorscheme()
-- require("rose-pine").set()
-- require('nightfox').set()
-- require('material').set()
