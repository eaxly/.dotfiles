local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local home = os.getenv("HOME").."/"
local utils = require("utils")

dashboard.section.header.val = require("plugins.dashboardHeaders")
dashboard.section.buttons.val = {
    dashboard.button( "e", "  New File" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "d", "  Dotfiles" , "<cmd>e " .. home.. ".dotfiles<cr>"),
    dashboard.button( "p", "  Projects", "<cmd>e "..home..".dotfiles<cr>"),
    dashboard.button( "o", "  History", "<cmd>Telescope oldfiles<cr>"),
    dashboard.button( "s", "  Find", "<cmd>Telescope find_files<cr>"),
    dashboard.button( "q", "  Quit" , ":qa<CR>"),
}

dashboard.section.footer.val = utils.quote_dragon()
alpha.setup(dashboard.opts)
