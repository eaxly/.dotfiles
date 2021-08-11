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

-- setting the theme
-- vim.g.colors_name = "everforest"
require("tokyonight").colorscheme()
