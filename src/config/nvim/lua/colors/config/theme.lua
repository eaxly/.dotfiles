local theme = "__[nvim_color_name]__"
local configs = {}
-- rose pine
configs.rosepine = {
  setup = function()
    vim.g.rose_pine_disable_background = false
    vim.g.rose_pine_variant = "__[nvim_color_style]__"

    vim.g.rose_pine_bold_vertical_split_line = true
    vim.g.rose_pine_inactive_background = false
    vim.g.rose_pine_disable_background = false
    vim.g.rose_pine_disable_float_background = false
    vim.g.rose_pine_disable_italics = false

    local p = require("rose-pine.palette")
    vim.g.rose_pine_colors = {
      headings = {
        h1 = p.iris,
        h2 = p.foam,
        h3 = p.rose,
        h4 = p.gold,
        h5 = p.pine,
        h6 = p.foam,
      },
    }
    vim.cmd("colorscheme rose-pine")
  end,
  colors = {
    darker_bg = "#13111e",
  },
}

-- catppuccin
configs.catppuccin = {
  setup = function()
    print("unimplemented")
  end,
  colors = {
    darker_bg = "#hehehe",
  },
}

local colors = {}
if theme == "rose-pine" then
  configs.rosepine.setup()
  colors = configs.rosepine.colors
elseif theme == "catppuccin" then
  configs.catppuccin.setup()
  colors = configs.catppuccin.colors
end

return colors
