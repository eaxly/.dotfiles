-- useful functions
local M = {}

M.get_username = function()
	local username = os.getenv("%USERNAME%") or os.getenv("USER")
	return username:gsub("^%l", string.upper)
end

M.quote = function()
  math.randomseed(os.time())
	local quotes = {
    { text = "If you make a mistake, kill all the witnesses.", author = "SweetAnita" },
    { text = "Before you criticize someone, walk a mile in their shoes. That way, you’ll be a mile from them, and you’ll have their shoes.", author = "Jack Handey"},
	}

	return quotes[math.random(#quotes)]
end

M.fortune = function()
  local handle = io.popen("fortune -s")
  local fortune = handle:read("*a")
  handle:close()

	return fortune
end

M.fowtune= function()
  local handle = io.popen("fortune -s | uwuify")
  local fowtune = handle:read("*a")
  handle:close()

	return fowtune
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

-- inspired by nvchad
M.map = function(mode, key, command, desc, opt)
  local present, legendary = pcall(require, "legendary")
  if present then
	local options = { noremap = true, silent = true }
	if opt then
		options = vim.tbl_extend("force", options, opt)
	end
  legendary.bind_keymap({ key, command, description = desc, opts = options, mode = mode, })
  else
      vim.notify("legendary wasn't found", vim.log.levels.WARN)
  end
end

M.drama_quotes = function()
	math.randomseed(os.time())
	local messages = {
		"The Legend of NeoVim!",
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
