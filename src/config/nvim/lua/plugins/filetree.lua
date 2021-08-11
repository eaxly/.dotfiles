local tree_cb = require'nvim-tree.config'.nvim_tree_callback

function NvimTreeTrash()
    local lib = require('nvim-tree.lib')
    local function on_exit(job_id, data, event)
        lib.refresh_tree()
    end
    local node = lib.get_node_at_cursor()
    if node then
        vim.fn.jobstart("trash " .. node.absolute_path, {
        detach = true,
        on_exit = on_exit,
    })
    end
end

function NvimTreeOSOpen()
    local lib = require"nvim-tree.lib"
    local node = lib.get_node_at_cursor()
    if node then
        vim.fn.jobstart("xdg-open '" .. node.absolute_path .. "' &", {detach = true} )
    end
end

vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_hijack_netrw = 1
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_ignore = {'.git'}
vim.g.nvim_tree_disable_default_keybindings = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_hide_dotfiles = 1
-- default mappings

vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "C"},    cb = tree_cb("cd") },
    { key = "<C-v>",                        cb = tree_cb("vsplit") },
    { key = "<C-x>",                        cb = tree_cb("split") },
    { key = "<C-t>",                        cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "<Tab>",                        cb = tree_cb("preview") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    { key = "d",                            cb = ":lua NvimTreeTrash()<cr>"},
    { key = "r",                            cb = tree_cb("rename") },
    { key = "<C-r>",                        cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "-",                            cb = tree_cb("dir_up") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "?",                            cb = tree_cb("toggle_help") },
    { key = "<C-o>",                        cb = ":lua NvimTreeOSOpen()<cr>" }
}
