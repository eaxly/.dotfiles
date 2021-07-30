function NvimTreeTrash()
    local lib = require"nvim-tree.lib"
    local node = lib.get_node_at_cursor()
    lib.refresh_tree()
    if node then
        vim.fn.jobstart("trash " .. node.absolute_path .. " &", {detach = true})
    end
    lib.refresh_tree()
end

function NvimTreeOSOpen()
    local lib = require"nvim-tree.lib"
    local node = lib.get_node_at_cursor()
    if node then
        vim.fn.jobstart("xdg-open '" .. node.absolute_path .. "' &", {detach = true})
    end
    lib.refresh_tree()
end

vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_follow = true
vim.g.nvim_tree_lsp_diagnostics = true
vim.g.nvim_tree_update_cwd = true
vim.g.nvim_tree_hijack_netrw = true
-- default mappings
vim.g.nvim_tree_bindings = {
    { key = "t", cb = ":lua NvimTreeTrash()<cr>" },
    { key = "O", cb = ":lua NvimTreeOSOpen()<cr>" }
}

require("nvim-tree.events").on_nvim_tree_ready(function()
  vim.cmd("NvimTreeRefresh")
end)
