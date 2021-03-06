local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local home = os.getenv("HOME")
local utils = require("core.utils")

local date_handle = io.popen('printf "$(date "+%a %d %b")"')
local date = date_handle:read("*a")
date_handle:close()

local function date_head()
  if utils.christmas_check() then
    return "🎁 Merry Christmas! 🎁"
  else
    return "──   Today is " .. date .. " ──"
  end
end

local date_header = {
  type = "text",
  val = date_head(),
  opts = {
    position = "center",
    hl = "AlphaSubheader",
  },
}

local header = {
  type = "text",
  val = require("configs.dashboardHeaders"),
  opts = {
    position = "center",
    hl = "AlphaHeader",
    -- wrap = "overflow";
  },
}

local footer = {
  text = {
    type = "text",
    val = function()
      return utils.quote().text
    end,
    opts = {
      position = "center",
      hl = "AlphaFooterText",
    },
  },
  author = {
    type = "text",
    val = function()
      return "- " .. utils.quote().author
    end,
    opts = {
      position = "center",
      hl = "AlphaFooterAuthor",
    },
  },
}

local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "AlphaButtonShortcut",
    hl = "AlphaButton",
  }
  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "  new", ":ene <BAR> startinsert <CR>"),
    button("d", "  dots", "<cmd>cd " .. home .. "/.dotfiles <bar> NvimTreeToggle<cr>"),
    button("p", "  dev", "<cmd>cd " .. home .. "/dev <bar> NvimTreeToggle<cr>"),
    button("g", "g  gtd", "<cmd>cd " .. home .. "/sync/lorg/gtd/ <bar> NvimTreeToggle <cr>"),
    button("s", "  find", "<cmd>Telescope find_files<cr>"),
    button("q", "  quit", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  header = header,
  date_header = date_header,
  buttons = buttons,
  footer = footer,
}

local opts = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.date_header,
    { type = "padding", val = 2 },
    section.buttons,
    { type = "padding", val = 5 },
    section.footer.text,
    section.footer.author,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)
