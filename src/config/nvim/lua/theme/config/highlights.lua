-- Reference: NvChad

local c = require("theme.config.colors")
local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg

-- cursorline
vim.cmd("hi clear CursorLine")

-- comments
fg("Comment", c.black_br .. " gui=italic")

-- eof
fg("EndOfBuffer", c.bg)

-- vertsplit
fg("VertSplit", c.bg_alt)

-- Float
fg("FloatBorder", c.green_br)
fg_bg("NormalFloat", c.fg_alt, c.bg_dark)

-- LineNr
fg("LineNr", c.bg_alter)

-- Pmenu
bg("Pmenu", c.bg_dark)
bg("PmenuSbar", c.bg)
fg_bg("PmenuSel", c.bg, c.fg)
bg("PmenuThumb", c.green)
fg("CmpItemAbbr", c.fg)
fg("CmpItemAbbrMatch", c.fg_alt)
fg("CmpItemKind", c.green_br)
fg("CmpItemMenu", c.cyan_br .. " gui=bold")

-- TS
fg("TSUnderline", c.fg_alt .. " gui=underline")
fg("TSStrike", c.fg_alt .. " gui=strikethrough")
fg("TSType", c.yellow_br)

-- Plugins --
-- treesitter
fg("TSLabel", c.red_br)
-- nvimtree
bg("NvimTreeNormal", c.bg_dark)
bg("NvimTreeNormalNC", c.bg_dark)
fg("NvimTreeIndentMarker", c.black)
fg("NvimTreeVertSplit", c.bg_dark)
fg("NvimTreeEndOfBuffer", c.bg_dark)
fg("NvimTreeFolderName", c.fg_alt)
fg("NvimTreeFolderIcon", c.yellow)
fg("NvimTreeEmptyFolderName", c.red)
fg("NvimTreeOpenedFolderName", c.yellow)
fg("NvimTreeRootFolder", c.green .. " gui=italic")
fg("NvimTreeSymlink", c.yellow .. " gui=underline")
fg("NvimTreeExecFile", c.green .. " gui=bold")
fg("NvimTreeMarkdownFile", c.magenta)
fg("NvimTreeSpecialFile", c.magenta_br .. " gui=bold")

fg("NvimTreeGitDirty", c.red)
fg("NvimTreeGitStaged", c.green_br)
fg("NvimTreeGitMerge", c.yellow_br)
fg("NvimTreeGitRenamed", c.blue_br)
fg("NvimTreeGitNew", c.green_br)
fg("NvimTreeGitDeleted", c.red_br)

-- Alpha
fg("AlphaHeader", c.green)
fg("AlphaSubheader", c.green_br)
fg("AlphaButton", c.cyan)
fg("AlphaButtonShortcut", c.cyan)
fg("AlphaFooterText", c.blue)
fg("AlphaFooterText", c.blue_br)

-- Telescope
fg_bg("TelescopeBorder", c.bg_dark, c.bg_dark)
fg_bg("TelescopePromptBorder", c.black_br, c.black_br)

fg_bg("TelescopePromptNormal", c.white, c.black_br)
fg_bg("TelescopePromptPrefix", c.red, c.black_br)

bg("TelescopeNormal", c.bg_dark)

fg_bg("TelescopePreviewTitle", c.bg_dark, c.green)
fg_bg("TelescopeResultsTitle", c.bg_dark, c.yellow)
fg_bg("TelescopePromptTitle", c.bg_dark, c.red)

fg("TelescopeSelection", c.cyan)

-- Indent Blankline
fg("IndentBlanklineChar", c.bg_alter)
