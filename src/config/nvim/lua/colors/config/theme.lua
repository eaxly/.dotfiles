local base16 = require("base16")
local theme = {  }

theme.colors = {
    bg = "#191724",
    fg = "#e0def4",
    red = "#eb6f92",
    green = "#31748f",
    yellow = "#f6c177",
    blue = "#9ccfd8",
    magenta = "#c4a7e7",
    cyan = "#ebbcba",

    -- Alternative colors
    bgAlt = "#2a2837",
    bgAlt2 = "#3a384a",
    fgAlt = "#6e6a86",
    fgAlt2 = "#555169",

    -- Base16
    base00 = "#191724",
    base01 = "#1f1d2e",
    base02 = "#26233a",
    base03 = "#555169",
    base04 = "#6e6a86",
    base05 = "#e0def4",
    base06 = "#f0f0f3",
    base07 = "#c5c3ce"
}

local function strip_hash(hex)
    return hex:gsub("#", "")
end

local c = theme.colors
local b00 = strip_hash(c.base00)
local b01 = strip_hash(c.base01)
local b02 = strip_hash(c.base02)
local b03 = strip_hash(c.base03)
local b04 = strip_hash(c.base04)
local b05 = strip_hash(c.base05)
local b06 = strip_hash(c.base06)
local b07 = strip_hash(c.base07)
local b08 = strip_hash(c.red)
local b09 = strip_hash(c.yellow)
local b0B = strip_hash(c.green)
local b0C = strip_hash(c.blue)
local b0D = strip_hash(c.magenta)
local b0E = strip_hash(c.cyan)

-- Set neovim theme.
base16.themes["kizu"] = {
    base00 = b00; base01 = b01; base02 = b02; base03 = b03;
    base04 = b04; base05 = b05; base06 = b06; base07 = b07;
    base08 = b08; base09 = b09; base0A = "e79c61"; base0B = b0B;
    base0C = b0C; base0D = b0D; base0E = b0E; base0F = "d65d0e";
}

base16(base16.themes["kizu"], true)
return theme
