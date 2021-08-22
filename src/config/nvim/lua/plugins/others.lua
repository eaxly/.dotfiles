local M = {}

M.suda = function()
    vim.g.suda_smart_edit = true
end

M.blankline = function()
    vim.g.indent_blankline_char = "│"--""
    vim.g.indent_blankline_filetype_exclude = { "help", "dashboard", "CHADTree", "terminal", "man", "packer", "NvimTree", "python" } -- indent-blankline breaks on python filetype
    vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile"}
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_trailing_blankline_indent = true -- fixes python
    vim.g.indent_blankline_show_current_context = true
    vim.wo.colorcolumn = "99999"
end

M.gitsigns = function()
    local present, gitsigns = pcall(require, "gitsigns")
    if not present then
        return false
    end

    gitsigns.setup({
        current_line_blame = true,
        current_line_blame_delay = 1000,
        current_line_blame_position = "eol",
    })
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if not present then
        return false
    end
    colorizer.setup()
end

M.lazygit = function()
    vim.g.lazygit_floating_window_use_plenary = true
    vim.g.lazygit_use_neovim_remote = false
end

return M
