local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

-- lir plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D'] = function()
        local ctx = require("lir").get_context()
        local current = ctx:current()

        vim.fn.system("trash " .. current.fullpath)
        actions.reload()
    end,

    ['J'] = function()
        mark_actions.toggle_mark()
        vim.cmd('normal! j')
    end,

    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,

    },
    float = {
        winblend = 0,
    },
    hide_cursor = true,
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})
-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  -- vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

require("lir.git_status").setup()

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

