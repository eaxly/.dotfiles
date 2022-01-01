-- useful functions
local M = {}

M.get_username = function()
  local username = os.getenv("%USERNAME%") or os.getenv("USER")
  return username:gsub("^%l", string.upper)
end

M.quote_dragon = function()
  local quotes = {
    "Truly wonderful the mind of a child is. - Master Yoda",
    "Feel the force! - Master Yoda",
    "Disgusting KFC Chicken, I smell. - Master Yoda?",
    "You will find only what you bring in. - Master Yoda",
    "Give off light, or darkness, Padawan. Be a candle, or the night. - Master Yoda",
    "Size matters not. - Master Yoda",
    "Jeff Who? - Elon Musk",
    "Where is the chocolate. - Anonymous",
    "A man consists of Flesh, Water, and some other stuff. - Me",
    "The Lamp turns on when you press a button. - M. Lara K.",
    "Only a symbolic amount of coffee, sir. - M. I. K.",
    "do be do be do. - Scooby Do", -- apparently
    "",
  }

  return quotes[math.random(#quotes)]
end

M.fortune = function()
  local handle = io.popen("fortune -s")
  local fortune = handle:read("*a")
  handle:close()

  return fortune
end

M.christmas_check = function()
  local handle = io.popen("printf \"$(date '+%d.%m')\"")
  local date = handle:read("*a")
  handle:close()

  if date == "24.12" or date == "25.12" or date == "26.12" then
    return true
  else
    return false
  end
end

-- copy pasted from NvChad
M.map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  -- all valid modes allowed for mappings
  -- :h map-modes
  local valid_modes = {
    [""] = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  -- helper function for M.map
  -- can gives multiple modes and keys
  local function map_wrapper(sub_mode, lhs, rhs, sub_options)
    if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
        map_wrapper(sub_mode, key, rhs, sub_options)
      end
    else
      if type(sub_mode) == "table" then
        for _, m in ipairs(sub_mode) do
          map_wrapper(m, lhs, rhs, sub_options)
        end
      else
        if valid_modes[sub_mode] and lhs and rhs then
          vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
        else
          sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
          print("Cannot set mapping [ mode = '" .. sub_mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
        end
      end
    end
  end

  map_wrapper(mode, keys, command, options)
end

M.drama_quotes = function()
  math.randomseed(os.time())
  local messages = {
    "The Legend of NeoVim!",
    "Eating fishes are we gollum?",
    "LOTR Chad",
    "memes are great",
    "hey there",
  }
  return messages[math.random(1, #messages)]
end

-- Highlights functions
-- yanked from https://github.com/NvChad/NvChad/blob/main/lua/core/utils.lua

-- Define bg color
-- @param group Group
-- @param color Color
M.bg = function(group, col)
  vim.cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
  vim.cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end
return M
