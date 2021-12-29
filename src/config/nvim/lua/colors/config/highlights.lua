-- Reference: NvChad

local c = require("colors.config.theme")
local fg = require("core.utils").fg
local bg = require("core.utils").bg

-- cursorline
vim.cmd("hi clear CursorLine")

-- nvimtree
bg("NvimTreeNormal", c.darker_bg)
bg("NvimTreeNormalNC", c.darker_bg)
