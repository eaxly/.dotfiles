local present, utils = pcall(require, "utils")
local present2, headers = pcall(require, "plugins.dashboardHeaders")
if not present2 then
    error("DASBOARD.LUA: Headers were not found!")
    return false
end
if not present then
    error("DASHBOARD.LUA: Utils was not found!")
    return false
end

vim.g.dashboard_default_executive = "telescope"
-- if somebody could implement random headers that would be awesome! <3
vim.g.dashboard_custom_header = headers.lotr

if utils.get_username() ~= nil then
    vim.g.dashboard_custom_footer = {
        " A wizard is never late, "
            .. utils.get_username()
            .. " Baggings. Nor is he early; he arrives precisely when he means to.",
    }
else
    vim.g.dashboard_custom_footer = {
        " A wizard is never late,"
            .. "Frodo Baggings"
            .. ". Nor is he early; he arrives precisely when he means to.",
    }
end

vim.g.dashboard_custom_section = {
    a_config_files = {
        description = { "  Open NeoVim Configuration Files            " },
        command = "cd " .. os.getenv("HOME") .. "/.config/nvim/ " .. " | CHADopen ",
    },

    dotfiles = {
        description = { "  Open Dotfiles                              " },
        command = "cd " .. os.getenv("HOME") .. "/.dotfiles/ " .. " | CHADopen ",
    },

    c_projects = {

        description = { "  Open Projects                              " },
        command = "cd " .. os.getenv("HOME") .. "/Projects" .. " | CHADopen",
    },
    d_history = {
        description = { "  Search History                              " },
        command = "Telescope oldfiles",
    },

    e_find_files = {
        description = { "  Find a file in the current directory        " },
        command = "Telescope find_files",
    },
}
