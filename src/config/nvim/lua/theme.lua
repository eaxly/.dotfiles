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

-- nightfox
vim.g.nightfox_italic_keywords = true
vim.g.nightfox_italic_comments = true
vim.g.nightfox_style = "duskfox"

-- material
vim.g.material_style = "deep ocean"

require("material").setup({
	contrast = false, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = true, -- Enable borders between verticaly split windows

	italics = {
		comments = true , -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf", -- Darker qf list background
        "lir"
	},

	text_contrast = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true -- Hide the end-of-buffer lines
	}
})
-- setting the theme
-- yes there are a lot of scraped things here
-- vim.g.colors_name = "everforest"
-- require("tokyonight").colorscheme()
-- require("rose-pine").set()
-- require('nightfox').set()
-- require('material').set()
vim.cmd [[colorscheme material]]
