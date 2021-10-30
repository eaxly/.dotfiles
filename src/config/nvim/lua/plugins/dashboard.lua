local utils = require("utils")
local header = require("plugins.dashboardHeaders")

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = header

local name = utils.get_username() or "Frodo"
vim.g.dashboard_custom_footer = {
    " A wizard is never late, "
        .. name
        .. " Baggings. Nor is he early; he arrives precisely when he means to.",
        utils.quote_dragon()
}

vim.g.dashboard_custom_section = {
    a_projects = {
        description = { "  Open Projects                              " },
        command = ":e " .. os.getenv("HOME") .. "/dev",
    },

    b_dotfiles = {
        description = { "  Open Dotfiles                              " },
        command = ":e " .. os.getenv("HOME") .. "/.dotfiles",
    },

    c_history = {
        description = { "  Search History                             " },
        command = "Telescope oldfiles",
    },

    d_find_files = {
        description = { "  Find a file in the current directory       " },
        command = "Telescope find_files",
    },
}
